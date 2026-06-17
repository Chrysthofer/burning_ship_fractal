NOP
#PRNAME burning_ship
#NUBITS 32
#NBMANT 23
#NBEXPO 8
#NDSTAC 64
#SDEPTH 32
#NUIOIN 1
#NUIOOU 1
#NUGAIN 128
@main F_NEG_M 2.0
SET main_xmin
F_NEG_M 2.0
SET main_ymin
LOD 0.00273437
SET main_dx
LOD 0.00416667
SET main_dy
LOD 4.0
SET main_bail
LOD 0.0
SET main_fy
LOD 0
SET main_py
@Lwh1 LOD 720
LES main_py
JIZ Lwh1end
LOD main_fy
F_MLT main_dy
F_ADD main_ymin
SET main_cy
LOD 0.0
SET main_fx
LOD 0
SET main_px
@Lwh2 LOD 1280
LES main_px
JIZ Lwh2end
LOD main_fx
F_MLT main_dx
F_ADD main_xmin
SET main_cx
LOD 0.0
SET main_zx
LOD 0.0
SET main_zy
LOD 0.0
SET main_zx2
LOD 0.0
SET main_zy2
LOD 0
SET main_n
@Lwh3 LOD 256
LES main_n
JIZ Lwh3end
LOD main_zx2
F_ADD main_zy2
P_LOD main_bail
SF_GRE
JIZ Lif1else
JMP Lwh3end
@Lif1else F_ABS_M main_zx
SET main_ax
F_ABS_M main_zy
SET main_ay
LOD 2.0
F_MLT main_ax
F_MLT main_ay
F_ADD main_cy
SET main_zy
LOD main_zx2
F_SU1 main_zy2
F_ADD main_cx
SET main_zx
F_MLT main_zx
SET main_zx2
LOD main_zy
F_MLT main_zy
SET main_zy2
LOD main_n
ADD 1
SET main_n
JMP Lwh3
@Lwh3end LOD main_n
OUT 0
LOD main_fx
F_ADD 1.0
SET main_fx
LOD main_px
ADD 1
SET main_px
JMP Lwh2
@Lwh2end LOD main_fy
F_ADD 1.0
SET main_fy
LOD main_py
ADD 1
SET main_py
JMP Lwh1
@Lwh1end @fim JMP fim
