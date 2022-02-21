/******************************************************************************
 * Copyright Contributors to the UltraZohm project.
 * Copyright 2021 Dennis Hufnagel
 * Copyright 2022 Valentin Hoppe
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

#include "uz_Transformation.h"
#include "../uz_HAL.h"
#include <math.h>
uz_dq_t uz_dq_transformation(uz_UVW_t input, float theta_el_rad)
{
    uz_alphabeta_t ab = uz_clarke_transformation(input);
    float sin_coefficent = sinf(theta_el_rad);
    float cos_coefficent = cosf(theta_el_rad);
    uz_dq_t output = {
        .d = (cos_coefficent * ab.alpha) + (sin_coefficent * ab.beta),
        .q = (-sin_coefficent * ab.alpha) + (cos_coefficent * ab.beta),
        .zero = ab.gamma};
    return (output);
}

uz_UVW_t uz_dq_inverse_transformation(uz_dq_t input, float theta_el_rad)
{

    float sin_coefficent = sinf(theta_el_rad);
    float cos_coefficent = cosf(theta_el_rad);
    uz_alphabeta_t ab = {
        .alpha = (cos_coefficent * input.d) - (sin_coefficent * input.q),
        .beta = (sin_coefficent * input.d) + (cos_coefficent * input.q),
        .gamma = input.zero};
    uz_UVW_t output = uz_clarke_inverse_transformation(ab);
    return (output);
}

uz_alphabeta_t uz_clarke_transformation(uz_UVW_t input)
{
    uz_alphabeta_t output = {
        .alpha = (2.0f / 3.0f) * (input.U - (input.V / 2.0f) - (input.W / 2.0f)),
        .beta = (2.0f / 3.0f) * ((input.V * (sqrtf(3.0f) / 2.0f)) - (input.W * (sqrtf(3.0f) / 2.0f))),
        .gamma = (1.0f / 3.0f) * (input.U + input.V + input.W)};
    return (output);
}

uz_UVW_t uz_clarke_inverse_transformation(uz_alphabeta_t input)
{
    uz_UVW_t output = {
        .U = input.alpha + input.gamma,
        .V = (input.alpha * (-1.0f / 2.0f)) + (input.beta * (sqrtf(3.0f) / 2.0f)) + input.gamma,
        .W = (input.alpha * (-1.0f / 2.0f)) + (input.beta * (-sqrtf(3.0f) / 2.0f)) + input.gamma};
    return (output);
}

float uz_9ph_arraymul(int line, float matrixval[9][9], float val[9])
{
    float output = 0.0f;
    for (int i = 0; i < 9; i++)
        output = output + matrixval[line][i] * val[i];
    return output;
}

uz_alphabeta_9ph_t uz_9ph_clarke_transformation(uz_abc_9ph_t input)
{
    uz_alphabeta_9ph_t output = {0};
    float val[9] = {0.0f};

    // VSD matrix from Matlab script, see Docs
    float vsd_mat[9][9] =
        {
            {0.2222222f, -0.1111111f, -0.1111111f, 0.2088206f, -0.1702321f, -0.0385885f, 0.1702321f, -0.2088206f, 0.0385885f},
            {0.0000000f, 0.1924501f, -0.1924501f, 0.0760045f, 0.1428417f, -0.2188462f, 0.1428417f, 0.0760045f, -0.2188462f},
            {0.2222222f, 0.2222222f, 0.2222222f, 0.1111111f, 0.1111111f, 0.1111111f, -0.1111111f, -0.1111111f, -0.1111111f},
            {0.0000000f, -0.0000000f, -0.0000000f, 0.1924501f, 0.1924501f, 0.1924501f, 0.1924501f, 0.1924501f, 0.1924501f},
            {0.2222222f, -0.1111111f, -0.1111111f, -0.0385885f, 0.2088206f, -0.1702321f, -0.2088206f, 0.0385885f, 0.1702321f},
            {0.0000000f, -0.1924501f, 0.1924501f, 0.2188462f, -0.0760045f, -0.1428417f, -0.0760045f, 0.2188462f, -0.1428417f},
            {0.2222222f, -0.1111111f, -0.1111111f, -0.1702321f, -0.0385885f, 0.2088206f, 0.0385885f, 0.1702321f, -0.2088206f},
            {0.0000000f, 0.1924501f, -0.1924501f, 0.1428417f, -0.2188462f, 0.0760045f, -0.2188462f, 0.1428417f, 0.0760045f},
            {0.1111111f, 0.1111111f, 0.1111111f, 0.1111111f, 0.1111111f, 0.1111111f, 0.1111111f, 0.1111111f, 0.1111111f}};

    // write values of abc struct to array for easier usage
    val[0] = input.a1;
    val[1] = input.b1;
    val[2] = input.c1;
    val[3] = input.a2;
    val[4] = input.b2;
    val[5] = input.c2;
    val[6] = input.a3;
    val[7] = input.b3;
    val[8] = input.c3;

    // apply transformation matrix
    output.alpha = uz_9ph_arraymul(0, vsd_mat, val);
    output.beta = uz_9ph_arraymul(1, vsd_mat, val);
    output.o1 = uz_9ph_arraymul(2, vsd_mat, val);
    output.o2 = uz_9ph_arraymul(3, vsd_mat, val);
    output.x1 = uz_9ph_arraymul(4, vsd_mat, val);
    output.y1 = uz_9ph_arraymul(5, vsd_mat, val);
    output.x2 = uz_9ph_arraymul(6, vsd_mat, val);
    output.y2 = uz_9ph_arraymul(7, vsd_mat, val);
    output.zero = uz_9ph_arraymul(8, vsd_mat, val);
    return (output);
}

uz_abc_9ph_t uz_9ph_clarke_inverse_transformation(uz_alphabeta_9ph_t input)
{
    uz_abc_9ph_t output = {0};
    float val[9] = {0.0f};

    // VSD matrix from Matlab script, see Docs
    float vsd_mat[9][9] =
        {
            {1.0000000f, 0.0000002f, -0.0000002f, -1.7320511f, 0.9999998f, 0.0000001f, 1.0000000f, -0.0000000f, 3.0000005f},
            {-0.5000001f, 0.8660257f, 0.0000000f, -1.7320509f, -0.5000000f, -0.8660253f, -0.4999999f, 0.8660253f, 3.0000000f},
            {-0.5000000f, -0.8660253f, 0.0000000f, -1.7320509f, -0.5000000f, 0.8660254f, -0.5000001f, -0.8660254f, 3.0000000f},
            {0.9396926f, 0.3420202f, 1.5000002f, 2.5980763f, -0.1736481f, 0.9848076f, -0.7660445f, 0.6427875f, -3.0000005f},
            {-0.7660444f, 0.6427875f, 1.4999998f, 2.5980761f, 0.9396926f, -0.3420202f, -0.1736481f, -0.9848077f, -2.9999995f},
            {-0.1736481f, -0.9848077f, 1.5000002f, 2.5980763f, -0.7660444f, -0.6427878f, 0.9396926f, 0.3420201f, -3.0000005f},
            {0.7660444f, 0.6427878f, -1.4999998f, -0.8660253f, -0.9396927f, -0.3420200f, 0.1736483f, -0.9848078f, 2.9999995f},
            {-0.9396926f, 0.3420202f, -1.4999999f, -0.8660253f, 0.1736481f, 0.9848078f, 0.7660445f, 0.6427876f, 2.9999998f},
            {0.1736481f, -0.9848076f, -1.5000000f, -0.8660254f, 0.7660444f, -0.6427876f, -0.9396925f, 0.3420201f, 3.0000000f}};

    // write values of abc struct to array for easier usage
    val[0] = input.alpha;
    val[1] = input.beta;
    val[2] = input.o1;
    val[3] = input.o2;
    val[4] = input.x1;
    val[5] = input.y1;
    val[6] = input.x2;
    val[7] = input.y2;
    val[8] = input.zero;

    // apply transformation matrix
    output.a1 = uz_9ph_arraymul(0, vsd_mat, val);
    output.b1 = uz_9ph_arraymul(1, vsd_mat, val);
    output.c1 = uz_9ph_arraymul(2, vsd_mat, val);
    output.a2 = uz_9ph_arraymul(3, vsd_mat, val);
    output.b2 = uz_9ph_arraymul(4, vsd_mat, val);
    output.c2 = uz_9ph_arraymul(5, vsd_mat, val);
    output.a3 = uz_9ph_arraymul(6, vsd_mat, val);
    output.b3 = uz_9ph_arraymul(7, vsd_mat, val);
    output.c3 = uz_9ph_arraymul(8, vsd_mat, val);
    return (output);
}

uz_dq_t uz_ab_to_dq_transformation(uz_alphabeta_t input, float theta_el_rad)
{
    float cos_theta = 0.0f;
    float sin_theta = 0.0f;
    uz_dq_t output = {0};
    cos_theta = cosf(theta_el_rad);
    sin_theta = sinf(theta_el_rad);
    output.d = cos_theta * input.alpha + sin_theta * input.beta;
    output.q = cos_theta * input.beta - sin_theta * input.alpha;
    output.zero = 0.0f;
    return output;
}

uz_alphabeta_t uz_dq_to_ab_inverse_transformation(uz_dq_t input, float theta_el_rad)
{
    float cos_theta = 0.0f;
    float sin_theta = 0.0f;
    uz_alphabeta_t output = {0};
    cos_theta = cosf(theta_el_rad);
    sin_theta = sinf(theta_el_rad);
    output.alpha = cos_theta * input.d - sin_theta * input.q;
    output.beta = sin_theta * input.d + cos_theta * input.q;
    output.gamma = 0.0f;
    return output;
}
