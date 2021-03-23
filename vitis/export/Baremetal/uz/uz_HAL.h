#ifndef UZ_HAL_H
#define UZ_HAL_H

// Set Target before including the HAL
#define TARGET_ULTRAZOHM 1
#define TARGET_SANDBOX 0

#if (TARGET_ULTRAZOHM == TARGET_SANDBOX)
#error Set TargetUltraZohm or Target Sandbox to one.
#endif

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#if (TARGET_SANDBOX==1)

#include <assert.h>
#include <stdio.h>

// The uz_assert macro abstracts the assert method of the platform
// For UltraZohm, use xil_assert.h with Xil_AssertVoid(Expression)
#define uz_assert assert
// Common to assert some pointer is not Null
// Map to platform specific assert macro
#define uz_assertNotNull(Expression) \
{                              \
    uz_assert(Expression!=NULL);        \
}

#define uz_printf printf

#define uz_Write32BitToRegister Write32BitDummy
#define uz_Read32BitFromRegister Read32BitDummy

#define UZ_SUCCESS 0
#define UZ_FAILURE 1

#endif

#if (TARGET_ULTRAZOHM==1)

#include "xil_assert.h"
#include "xil_io.h"
#include "xstatus.h"
#include <math.h>

// The uz_assert macro abstracts the assert method of the platform
// For UltraZohm, use xil_assert.h with Xil_AssertVoid(Expression)
#define uz_assert Xil_AssertVoid
// Common to assert some pointer is not Null
// Map to platform specific assert macro
#define uz_assertNotNull(Expression) \
{                              \
    uz_assert(Expression!=NULL);        \
}

#define uz_printf xil_printf

#define uz_Write32BitToRegister Xil_Out32
#define uz_Read32BitFromRegister Xil_In32

#define UZ_SUCCESS XST_SUCCESS
#define UZ_FAILURE XST_FAILURE

#endif

static inline void uz_writeFloatToAxi(uintptr_t Addr, float Value){
  volatile float *LocalAddr = (volatile float *)Addr;
  *LocalAddr = Value;
}

static inline float uz_readFloatFromAxi(uintptr_t Addr)
{
    return *(volatile float *) Addr;
}

static inline void uz_writeUnsingedInt32ToAxi(uintptr_t Addr, uint32_t Value){
  volatile uint32_t *LocalAddr = (volatile uint32_t *)Addr;
  *LocalAddr = Value;
}

static inline uint32_t uz_readUnsingedInt32FromAxi(uintptr_t Addr)
{
    return *(volatile uint32_t *) Addr;
}

static inline void uz_writeInt32ToAxi(uintptr_t Addr, int32_t Value){
  volatile int32_t *LocalAddr = (volatile int32_t *)Addr;
  *LocalAddr = Value;
}

static inline int32_t uz_readInt32FromAxi(uintptr_t Addr)
{
    return *(volatile int32_t *) Addr;
}

static inline void uz_writeBoolToAxi(uintptr_t Addr, _Bool enable){

	if(enable==true){
		uz_writeUnsingedInt32ToAxi(Addr, (uint32_t)0x00000001);
	}
	if(enable==false){
		uz_writeUnsingedInt32ToAxi(Addr, (uint32_t)0x00000000);
	}
}

static inline float uz_sfixedToFloat(int32_t data, int numberOfFractionalBits){
	uz_assert(numberOfFractionalBits>=0);
	return (ldexpf((float)data, -numberOfFractionalBits));
}

static inline int32_t uz_FloatToSfixed(float data, int numberOfFractionalBits){
	uz_assert(numberOfFractionalBits>=0);
	return ((int32_t)ldexpf(data, numberOfFractionalBits));
}


#endif // Endif of guard

