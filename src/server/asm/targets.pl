### Assembler targets ###
@asm_files = qw(
I_BAR   I_CTRL IB_TRD  IB_A     IC       IC_R    CRC      IJ_T
IB_T    I_READ I_EMASK IB_TD    I_EREMAP IB_ATRD IB_AT    IB_32
IB_ATD  IB_R   IB      IR_BAR   IB2      I_LINE  IB_ATR   IB_AR
IB_TR   IB_DW  I_PIXEL I_FREMAP I_BLACK  I_SNOW  IB_ATRDM IB_TRDM
IB_ATDM IR_AM  IR_A    IB_TDM   IR_M IR
);

assemble(@asm_files);
