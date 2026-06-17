NOP
#PRNAME complex_float_test
#NUBITS 32
#NBMANT 23
#NBEXPO 8
#NDSTAC 64
#SDEPTH 32
#NUIOIN 1
#NUIOOU 8
#NUGAIN 128
@main LOD 1.25
SET a
LOD 2.50
SET b
LOD 0.75
SET c
LOD a
F_MLT b
F_ADD c
SET r_arith
F2I_M r_arith
OUT 0
LOD 2.0
CAL float_sqrt
SET r_sqrt
F2I_M r_sqrt
OUT 1
LOD 0.785398163
CAL float_sin
SET r_sin
F2I_M r_sin
OUT 2
LOD 3.000000
SET z1
LOD 4.000000
SET z1_i
LOD 1.000000
SET z2
LOD 2.000000
SET z2_i
LOD z1
F_MLT z2
P_LOD z1_i
F_MLT z2_i
SF_SU2
P_LOD z1
F_MLT z2_i
P_LOD z1_i
F_MLT z2
SF_ADD
SET_P zmul_i
SET zmul
SET r_re
LOD zmul_i
SET r_im
F2I_M r_re
OUT 3
F2I_M r_im
OUT 4
LOD z1
F_MLT z1
P_LOD z1_i
F_MLT z1_i
SF_ADD
SET r_mod2
F2I_M r_mod2
OUT 5
LOD z1
PF_NEG_M z1_i
SET_P aux_var
F_ADD z2
P_LOD aux_var
F_ADD z2_i
SET_P zsum_i
SET zsum
SET r_sum_re
F2I_M r_sum_re
OUT 6
LOD 0.0
F_LES z2
JIZ Lfa1a
LOD z2
F_DIV z2_i
CAL float_atan
SET fase_t
LOD 0.0
F_LES z2_i
JIZ Lfa1b
LOD fase_t
F_ADD -3.14159265359
JMP Lfa1z
@Lfa1b LOD fase_t
F_ADD 3.14159265359
JMP Lfa1z
@Lfa1a LOD z2
F_LES 0.0
JIZ Lfa1c
LOD z2
F_DIV z2_i
CAL float_atan
JMP Lfa1z
@Lfa1c LOD z2_i
F_LES 0.0
JIZ Lfa1d
LOD 1.57079632679
JMP Lfa1z
@Lfa1d LOD 0.0
F_LES z2_i
JIZ Lfa1e
LOD -1.57079632679
JMP Lfa1z
@Lfa1e LOD 0.0
@Lfa1z SET r_phase
F2I_M r_phase
OUT 7
@Lwh1 LOD 1
JIZ Lwh1end
F2I_M r_phase
OUT 7
JMP Lwh1
@Lwh1end @fim JMP fim

// sqrt function --------------------------------------------------------------

@float_sqrt     SET sqrt_num       // get the parameter
              F_ROT                // first estimate (nearest power of 2)

                PSH                // update x
              F_DIV sqrt_num       // iteration 1
             SF_ADD
              F_MLT 0.5

                PSH                // update x
              F_DIV sqrt_num       // iteration 2
             SF_ADD
              F_MLT 0.5

                PSH                // update x
              F_DIV sqrt_num       // iteration 3
             SF_ADD
              F_MLT 0.5

                PSH                // update x
              F_DIV sqrt_num       // iteration 4
             SF_ADD
              F_MLT 0.5

                RET

// Arctangent function --------------------------------------------------------
// |x| is folded into [0,1] with the 1/x identity: atan(|x|) = pi/2 - atan(1/|x|)
// for |x|>1. atan(t) on [0,1] is a degree-11 odd minimax polynomial (least-
// squares fit, max abs error ~4.9e-6 -- ~6 digits, vs the old 49-point LUT's
// ~4e-5). One shared polynomial for both branches; no table, no new hardware.

@float_atan SET   atan_x                 // save x
            F_ABS_M atan_x               // ax = |x|
            SET   atan_ax
            F_LES 1.0                    // (ax > 1)?  [F_LES true when acc > X]
            SET   atan_big               // flag: 1 if |x|>1 (use 1/x)
            JIZ   L_atan_small
            LOD   atan_ax                // big branch: t = 1/ax
            F_DIV 1.0                    // 1.0 / ax   (F_DIV X = X/acc)
            JMP   L_atan_haveT
@L_atan_small LOD atan_ax               // small branch: t = ax
@L_atan_haveT SET atan_t

            F_MLT atan_t                 // w = t^2
            SET   atan_w
            LOD  -0.012300666580         // Horner in w: atan(t)/t = a1 + a3 w + ... + a11 w^5
            F_MLT atan_w                 // a11
            F_ADD 0.054084934779         // a9
            F_MLT atan_w
            F_ADD -0.117697073484        // a7
            F_MLT atan_w
            F_ADD 0.194020561451         // a5
            F_MLT atan_w
            F_ADD -0.332694520616        // a3
            F_MLT atan_w
            F_ADD 0.999980069822         // a1
            F_MLT atan_t                 // * t  -> atan(t)
            SET   atan_p

            LOD   atan_big
            JIZ   L_atan_done            // |x|<=1 -> result = atan(t)
            LOD   atan_p                 // |x|>1  -> result = pi/2 - atan(1/x)
            F_SU2 1.5707963268           // pi/2 - p   (F_SU2 X = X - acc)
            JMP   L_atan_sign
@L_atan_done LOD atan_p
@L_atan_sign F_SGN atan_x                // apply the sign of x
            RET

// Sine function --------------------------------------------------------------
// O(1) range reduction to [-pi/2, pi/2]: k = round(x/pi); r = x - k*pi; then
// sin(x) = (-1)^k * sin(r). sin(r) is a degree-7 odd minimax polynomial (the
// coefficients are a least-squares fit on [0, pi/2], max abs error ~1.6e-6 --
// ~6 digits, vs the old 152-point LUT's ~3). No lookup table, no new hardware.
// NB: F2I truncates toward zero, so round-to-nearest uses a sign-half bias.

@float_sin  SET   sin_x                  // save x
            F_MLT 0.3183098862           // q = x / pi   (1/pi)
            SET   sin_q
            LOD   0.5
            F_SGN sin_q                  // copysign(0.5, q)
            F_ADD sin_q                  // q + copysign(0.5,q)
            F2I                          // k = round(q)
            SET   sin_k                  // keep k (int) for the (-1)^k sign
            I2F                          // float(k)
            F_MLT 3.1415926536           // k * pi
            F_SU2 sin_x                  // r = x - k*pi  -> [-pi/2, pi/2]
            SET   sin_r
            F_MLT sin_r                  // w = r^2
            SET   sin_w

            LOD  -0.000184472138         // Horner in w: sin(r)/r = a1 + a3 w + a5 w^2 + a7 w^3
            F_MLT sin_w                  // a7
            F_ADD 0.008309516704         // a5
            F_MLT sin_w
            F_ADD -0.166651680787        // a3
            F_MLT sin_w
            F_ADD 0.999997487148         // a1
            F_MLT sin_r                  // * r  -> sin(r)
            SET   sin_p

            LOD   sin_k
            AND   1                      // k & 1  (parity)
            JIZ   L_sin_even             // k even -> +sin(r)
            LOD   sin_p
            F_NEG                        // k odd  -> -sin(r)
            RET
@L_sin_even LOD   sin_p
            RET
