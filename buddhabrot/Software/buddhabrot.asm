NOP
#PRNAME buddhabrot
#NUBITS 32
#NBMANT 23
#NBEXPO 8
#NDSTAC 64
#SDEPTH 16
#NUIOIN 1
#NUIOOU 1
#NUGAIN 128
#array hist 1 65536
#array trajx 2 500
#array trajy 2 500
@main LOD 0
SET main_ii
@Lwh1 LOD 65536
LES main_ii
JIZ Lwh1end
LOD main_ii
P_LOD 0
STI hist
LOD main_ii
ADD 1
SET main_ii
JMP Lwh1
@Lwh1end LOD 0
SET main_sy
@Lwh2 LOD 512
LES main_sy
JIZ Lwh2end
F_NEG_M 2.0
P_I2F_M main_sy
F_MLT 0.0078125
SF_ADD
SET main_cy
LOD 0
SET main_sx
@Lwh3 LOD 512
LES main_sx
JIZ Lwh3end
F_NEG_M 2.0
P_I2F_M main_sx
F_MLT 0.0078125
SF_ADD
SET main_cx
LOD 0.0
SET main_zx
LOD 0.0
SET main_zy
LOD 0
SET main_n
LOD 0
SET main_escaped
@Lwh4 LOD 500
LES main_n
JIZ Lwh4end
LOD main_n
P_LOD main_zx
STI trajx
LOD main_n
P_LOD main_zy
STI trajy
LOD main_zx
F_MLT main_zx
P_LOD main_zy
F_MLT main_zy
SF_SU2
F_ADD main_cx
SET main_zx2
LOD 2.0
F_MLT main_zx
F_MLT main_zy
F_ADD main_cy
SET main_zy2
LOD main_zx2
SET main_zx
LOD main_zy2
SET main_zy
LOD main_zx
F_MLT main_zx
P_LOD main_zy
F_MLT main_zy
SF_ADD
P_LOD 4.0
SF_GRE
JIZ Lif1else
LOD 1
SET main_escaped
JMP Lwh4end
@Lif1else LOD main_n
ADD 1
SET main_n
JMP Lwh4
@Lwh4end LOD 1
EQU main_escaped
JIZ Lif2else
LOD 0
SET main_k
@Lwh5 LOD main_n
LES main_k
JIZ Lwh5end
LOD main_k
LDI trajx
F_ADD 2.0
F_MLT 64.0
F2I
SET main_px
LOD main_k
LDI trajy
F_ADD 2.0
F_MLT 64.0
F2I
SET main_py
LOD 0
LES main_px
LIN
JIZ Lif3else
LOD 256
LES main_px
JIZ Lif4else
LOD 0
LES main_py
LIN
JIZ Lif5else
LOD 256
LES main_py
JIZ Lif6else
LOD main_py
MLT 256
ADD main_px
SET main_idx
P_LOD main_idx
LDI hist
ADD 1
STI hist
@Lif6else @Lif5else @Lif4else @Lif3else LOD main_k
ADD 1
SET main_k
JMP Lwh5
@Lwh5end @Lif2else LOD main_sx
ADD 1
SET main_sx
JMP Lwh3
@Lwh3end LOD main_sy
ADD 1
SET main_sy
JMP Lwh2
@Lwh2end LOD 0
SET main_p
@Lwh6 LOD 65536
LES main_p
JIZ Lwh6end
LOD main_p
LDI hist
OUT 0
LOD main_p
ADD 1
SET main_p
JMP Lwh6
@Lwh6end @fim JMP fim
