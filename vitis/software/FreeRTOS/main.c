/******************************************************************************
* Copyright 2021 Sebastian Wendel, Eyke Liegmann
* 
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* 
*     http://www.apache.org/licenses/LICENSE-2.0
* 
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and limitations under the License.
******************************************************************************/

#include <stdio.h>
#include "xparameters.h"
#include "netif/xadapter.h"
#include "xil_printf.h"

//Includes for Ethernet
#if LWIP_DHCP==1
#include "lwip/dhcp.h"
#endif

//Includes for CAN
#define CAN_ACTIVE 0 // (1 = CAN is active)  and (0 = CAN is inactive)
#include "include/can.h"

//Includes from own files
#include "main.h"
#include "defines.h"
#include "include/isr.h"

//Data from R5_0 to A53_0 (from BareMetal to FreeRTOS) in order to provide data for the GUI (Ethernet-Plot)
ARM_to_Oszi_Data_shared_struct OsziData;
ARM_to_Oszi_Data_shared_struct OsziData_Shadow;

//Data from A53_0 to R5_0 (from FreeRTOS to BareMetal) in order to receive control data from the GUI
Oszi_to_ARM_Data_shared_struct ControlData;

Xint16 i_LifeCheck, i_LifeCheck_mainThreat, i_LifeCheck_networkThreat, i_LifeCheck_IPC_Threat, i_LifeCheck_canThreat;

#ifdef XPS_BOARD_ZCU102
#ifdef XPAR_XIICPS_0_DEVICE_ID
int IicPhyReset(void);
#endif
#endif

#if LWIP_DHCP==1
extern volatile int dhcp_timoutcntr;
err_t dhcp_start(struct netif *netif);
#endif

static struct netif server_netif;
struct netif *echo_netif;

A53_Data Global_Data_A53;

//==============================================================================================================================================================
void print_ip(char *msg, ip_addr_t *ip)
{
	xil_printf(msg);
	xil_printf("%d.%d.%d.%d\n\r", ip4_addr1(ip), ip4_addr2(ip),
			ip4_addr3(ip), ip4_addr4(ip));
}

//==============================================================================================================================================================
void print_ip_settings(ip_addr_t *ip, ip_addr_t *mask, ip_addr_t *gw){

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}

//==============================================================================================================================================================
/*---------------------------------------------------------------------------*
 * Routine:  main
 *---------------------------------------------------------------------------*
 * Description:
 *      Starts only the main thread "main_thread()" with priority
 *      "DEFAULT_THREAD_PRIO". Afterwards nothing will happen here and the
 *      LifeCheck will not run further.
 *---------------------------------------------------------------------------*/
int main()
{
	//SW: Initialize the Interrupts in the main, because by doing it in the network-threat, there were always problems that the thread was killed.
	Initialize_InterruptHandler();

	//Start the main-threat
	sys_thread_new("main_thrd", (void(*)(void*))main_thread, 0,
	                THREAD_STACKSIZE,
	                DEFAULT_THREAD_PRIO);
	vTaskStartScheduler();

	while(1){
		i_LifeCheck++; //LifeCheck for main, but never runs, because of main-threat.
		if(i_LifeCheck > 2500){
			i_LifeCheck =0;
		}
	}
	return 0;
}

//==============================================================================================================================================================
/*---------------------------------------------------------------------------*
 * Routine:  network_thread
 *---------------------------------------------------------------------------*
 * Description:
 *      Initializes the InterruptServiceRoutine (ISR) in order to enable a
 *      Data transfer between the both processors in a deterministic time
 *      period. Afterwards the network thread enables the basic send and receive
 *      functions for the Ethernet/TCP communication with the receive thread
 *      "xemacif_input_thread()". This thread runs always!
 *---------------------------------------------------------------------------*/
void network_thread(void *p)
{
	// Initialize the Interrupts
	Initialize_ISR();

    struct netif *netif;
    /* the mac address of the board. this should be unique per board */
    unsigned char mac_ethernet_address[] = { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };
#if LWIP_IPV6==0
    ip_addr_t ipaddr, netmask, gw;
#if LWIP_DHCP==1
    int mscnt = 0;
#endif
#endif

    netif = &server_netif;

    xil_printf("\r\n\r\n");
    xil_printf("-----lwIP Socket Mode Echo server Demo Application ------\r\n");

#if LWIP_IPV6==0
#if LWIP_DHCP==0
    /* initialize IP addresses to be used */
    IP4_ADDR(&ipaddr,  192, 168, 1, 233);
    IP4_ADDR(&netmask, 255, 255, 255,  0);
    IP4_ADDR(&gw,      192, 168, 1, 1);
#endif

    /* print out IP settings of the board */

#if LWIP_DHCP==0
    print_ip_settings(&ipaddr, &netmask, &gw);
    /* print all application headers */
#endif

#if LWIP_DHCP==1
	ipaddr.addr = 0;
	gw.addr = 0;
	netmask.addr = 0;
#endif
#endif

    /* Add network interface to the netif_list, and set it as default */
    if (!xemac_add(netif, &ipaddr, &netmask, &gw, mac_ethernet_address, PLATFORM_EMAC_BASEADDR)) {
	xil_printf("Error adding N/W interface\r\n");
	return;
    }

    netif_set_default(netif);

    /* specify that the network if is up */
    netif_set_up(netif);

    /* start packet receive thread - required for lwIP operation */
    sys_thread_new("xemacif_input_thread", (void(*)(void*))xemacif_input_thread, netif,
            THREAD_STACKSIZE,
            DEFAULT_THREAD_PRIO);

#if CAN_ACTIVE==1
	xil_printf(" Init CAN \n\r"); //CAN interface
	//hal_can_init(XPAR_PSU_CAN_0_BASEADDR, XPAR_PSU_CAN_0_DEVICE_ID); //CAN 0 interface
	hal_can_init(XPAR_PSU_CAN_1_BASEADDR, XPAR_PSU_CAN_1_DEVICE_ID); //CAN 1 interface

	can_frame_t can_frame_rx; //CAN interface
#endif

#if LWIP_DHCP==1
    dhcp_start(netif);
    while (1) {
      	i_LifeCheck_networkThreat++; //LifeCheck
      	if(i_LifeCheck_networkThreat > 2500){
      		i_LifeCheck_networkThreat =0;
      	}

		#if CAN_ACTIVE==1
			if( ! hal_can_is_rx_empty() ){
				hal_can_receive_frame_blocking(&can_frame_rx);
				if(can_frame_rx.std_id == 0x22) {
				//	XcpCommand( (uint32_t *) can_frame_rx.data );
					can_send_2();
				} else {

					//hal_can_debug_print_frame(&can_frame_rx);
					//xil_printf("received a not XCP related CAN frame \n\r");
				}
				//usleep(1000 * 500);
			}else{
				can_send_1();
				//usleep(1000 * 500);
			}

			// no tx message pending
			if( hal_can_is_tx_done()) {
				//XcpSendCallBack();
			}
		#endif

		vTaskDelay(DHCP_FINE_TIMER_MSECS / portTICK_RATE_MS);
		dhcp_fine_tmr();
		mscnt += DHCP_FINE_TIMER_MSECS;
		if (mscnt >= DHCP_COARSE_TIMER_SECS*1000) {
			dhcp_coarse_tmr();
			mscnt = 0;
		}
	}
#else
    xil_printf("\r\n");
    xil_printf("%20s %6s %s\r\n", "Server", "Port", "Connect With..");
    xil_printf("%20s %6s %s\r\n", "--------------------", "------", "--------------------");

    print_echo_app_header();
    xil_printf("\r\n");
    sys_thread_new("echod", application_thread, 0,
		THREAD_STACKSIZE,
		DEFAULT_THREAD_PRIO);
    vTaskDelete(NULL);
#endif

    return;
}


//==============================================================================================================================================================
/*---------------------------------------------------------------------------*
 * Routine:  main_thread
 *---------------------------------------------------------------------------*
 * Description:
 *      Starts the network thread "network_thread()" with priority
 *      "DEFAULT_THREAD_PRIO". Afterwards the main thread starts and builds up
 *      the Ethernet communication. If it is not possible after a couple of
 *      seconds, a time-out will occur. If a communication is possible, the
 *      application thread "application_thread()" will be started.
 *      This thread runs only until the LifeCheck counter receives the value of 20
 *      with a step size of 0.25 second = 5 seconds (500us * 10000).
 *      This is also the time for the time-out (if no connection is available).
 *---------------------------------------------------------------------------*/
int main_thread()
{
#if LWIP_DHCP==1
	int mscnt = 0;
#endif

#ifdef XPS_BOARD_ZCU102
	IicPhyReset();
#endif

	/* initialize lwIP before calling sys_thread_new */
    lwip_init();

    /* any thread using lwIP should be created using sys_thread_new */
    //Open thread for Ethernet communication
    sys_thread_new("NW_THRD", network_thread, NULL,
		THREAD_STACKSIZE,
            DEFAULT_THREAD_PRIO);


#if LWIP_DHCP==1
    while (1) {

	i_LifeCheck_mainThreat++; //LifeCheck
	if(i_LifeCheck_mainThreat > 2500){
		i_LifeCheck_mainThreat =0;
	}

	vTaskDelay(DHCP_FINE_TIMER_MSECS / portTICK_RATE_MS);
		if (server_netif.ip_addr.addr) {
			xil_printf("DHCP request success\r\n");
			print_ip_settings(&(server_netif.ip_addr), &(server_netif.netmask), &(server_netif.gw));
			print_echo_app_header();
			xil_printf("\r\n");
			sys_thread_new("echod", application_thread, 0,
					THREAD_STACKSIZE,
					DEFAULT_THREAD_PRIO);
			break;
		}
		mscnt += DHCP_FINE_TIMER_MSECS;
		if (mscnt >=10000) { // define timeout time here
			// DHCP_COARSE_TIMER_SECS * 2000) {
			xil_printf("ERROR: DHCP request timed out\r\n");
			xil_printf("Configuring default IP of 192.168.1.233\r\n");
			IP4_ADDR(&(server_netif.ip_addr),  192, 168, 1, 233);
			IP4_ADDR(&(server_netif.netmask), 255, 255, 255,  0);
			IP4_ADDR(&(server_netif.gw),  192, 168, 1, 1);
			print_ip_settings(&(server_netif.ip_addr), &(server_netif.netmask), &(server_netif.gw));
			/* print all application headers */
			xil_printf("\r\n");
			xil_printf("%20s %6s %s\r\n", "Server", "Port", "Connect With..");
			xil_printf("%20s %6s %s\r\n", "--------------------", "------", "--------------------");

			print_echo_app_header();
			xil_printf("\r\n");
			sys_thread_new("echod", application_thread, 0,
					THREAD_STACKSIZE,
					DEFAULT_THREAD_PRIO);
			break;
		}
	}
#endif

    vTaskDelete(NULL);
    return 0;
}



//==============================================================================================================================================================
/*---------------------------------------------------------------------------*
 * Routine:  hal_can_debug_print_frame
 *---------------------------------------------------------------------------*
 * Description:
 *      CAN interface for testing
 *---------------------------------------------------------------------------*/
void hal_can_debug_print_frame(can_frame_t *can_frame_p)
{
	xil_printf("std_id: 0x%03X, dlc: %d, data[0]: 0x%02X \n\r",
			can_frame_p->std_id, can_frame_p->dlc, can_frame_p->data[0]);
}


//==============================================================================================================================================================
/*---------------------------------------------------------------------------*
 * Routine:  can_send_1
 *---------------------------------------------------------------------------*
 * Description:
 *      CAN interface for testing
 *---------------------------------------------------------------------------*/
void can_send_1(void)
{
	static uint8_t tick;
	tick++;
	if(tick > 250){
		tick =0;
	}

	//xil_printf("tick: 0x%02X \n\r", tick);
	//Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, tick);

	can_frame_t can_frame_tx;
	can_frame_tx.std_id = 0x123;
	can_frame_tx.dlc = 2;
	can_frame_tx.data[0] = 0x13;
	can_frame_tx.data[1] = tick;

	hal_can_send_frame_blocking(&can_frame_tx);
}


//==============================================================================================================================================================
/*---------------------------------------------------------------------------*
 * Routine:  can_send_2
 *---------------------------------------------------------------------------*
 * Description:
 *      CAN interface for testing
 *---------------------------------------------------------------------------*/
void can_send_2(void)
{
	static uint8_t tick;
	tick=tick+10;
	if(tick > 250){
		tick =0;
	}

	//xil_printf("tick: 0x%02X \n\r", tick);
	//Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, tick);

	can_frame_t can_frame_tx;
	can_frame_tx.std_id = 0x52;
	can_frame_tx.dlc = 2;
	can_frame_tx.data[0] = 0x12;
	can_frame_tx.data[1] = tick;

	hal_can_send_frame_blocking(&can_frame_tx);
}