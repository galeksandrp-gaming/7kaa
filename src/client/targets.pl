### Directories to build in ###
unless ($no_asm) {
  push (@dirs, 'asm');
}

### Compiler targets ###
@c_files = qw(
AM        OGAMESET  ORAIN2    OSPRITE2  OUNITIF
OAI_ACT   ODYNARR   OGAMHALL  ORAIN3    OSPRITEA  OUNITIND
OAI_ACT2  ODYNARRB  OGAMMAIN  ORAWRES   OSPRTRES  OUNITM
OAI_ATTK  OEFFECT   OGAMMENU  OREBEL    OSPY      OUNITRES
OAI_BUIL  OGAMSCE2  OREGION   OSPY2     OUNITS
OAI_CAP2  OERROR    OGAMSCEN  OREGIONS  OSPYA     OU_CARA
OAI_CAPT  OEXPMASK  OGAMSING  OSTR      OU_CARA2
OAI_DEFE  OFILE     OGENHILL  OSYS      OU_CARAS
OAI_DIPL  OFILETXT  OGENMAP   OSYS2     OU_CARAT
OAI_ECO   OFIRM     OGETA     OSYS3     OU_CART
OAI_GRAN  OFIRM2    OGFILE    ORES      OTALKENG  OU_GOD
OAI_INFO  OFIRMA    OGFILE2   ORESDB    OTALKMSG  OU_GOD2
OAI_MAIN  OFIRMAI   OGFILE3   ORESX     OTALKRES  OU_MARI
OAI_MAR2  OFIRMDIE  OGFILEA   OROCK     OTECHRES  OU_MARI2
OAI_MAR3  OFIRMDRW  OGODRES   OROCKRES  OTERRAIN  OU_MARIF
OAI_MARI  OFIRMIF   OGRPSEL   OR_AI     OTORNADO  OU_MARIS
OAI_MILI  OFIRMIF2  OHELP     OR_ECO    OTOWN     OU_MARIT
OAI_MONS  OFIRMIF3  OHILLRES  OR_MIL    OTOWNA    OU_MONS
OAI_QUER  OFIRMRES  OIMGRES   OR_NAT    OTOWNAI   OU_VEHI
OAI_SEEK  OFONT     OINFO     OR_NEWS   OTOWNBLD  OVBROWIF
OAI_SPY   OF_BASE   OINGMENU  OR_RANK   OTOWNDRW  OVBROWSE
OAI_TALK  OF_BASE2  OLIGHTN   OR_SPY    OTOWNIF   OVGA
OAI_TOWN  OF_CAMP   OLIGHTN2  OR_TECH   OTOWNIND  OVGA2
OAI_TRAD  OF_CAMP2  OLOG      OR_TOWN   OTOWNRES  OVGABUF
OAI_UNIT  OF_FACT   OLZW      OR_TRADE  OTRANSL   OVGABUF2
OANLINE   OF_FACT2  OMATRIX   OSCROLL   OTUTOR    OVGALOCK
OAUDIO    OF_HARB   OSE       OTUTOR2   OVIDEO
OBATTLE   OF_HARB2  OMISC     OSERES    OUNIT     OVOLUME
OBLOB     OF_INN    OMONSRES  OSFRMRES  OUNIT2    OVQUEUE
OBOX      OF_INN2   OMOUSE    OSITE     OUNITA    OWALLRES
OBULLET   OF_MARK   OMOUSECR  OSITEDRW  OUNITAAC  OWARPT
OBULLETA  OF_MARK2  OMP_CRC   OSKILL    OUNITAAT  OWEATHER
OBUTT3D   OF_MINE   OMUSIC    OSLIDCUS  OUNITAC   OWORLD
OBUTTCUS  OF_MINE2  ONATIONA  OSNOW1    OUNITAI   OWORLD_M
OBUTTON   OF_MONS   ONATIONB  OSNOW2    OUNITAM   OWORLD_Z
OB_FLAME  OF_RESE   ONEWS     OSNOWG    OUNITAMT  OW_FIRE
OB_HOMIN  OF_RESE2  ONEWS2    OSNOWRES  OUNITAT   OW_PLANT
OB_PROJ   OF_WAR    ONEWSENG  OSPATH    OUNITAT2  OW_ROCK
OCOLTBL   OF_WAR2   OOPTMENU  OSPATHBT  OUNITAT3  OW_SOUND
OCONFIG   OGAMCRED  OPLANT    OSPATHS2  OUNITATB  OW_WALL
OGAME     OPLASMA   OSPREOFF  OUNITD    OFLAME
ODATE     OPOWER    OSPRESMO  OUNITDRW  OGF_V1
ODB       OGAMENCY  ORACERES  OSPREUSE  OUNITHB   OMOUSESP
ODIR      OGAMEND   ORAIN1    OSPRITE   OUNITI    OMOUSEGE
OMOUSEFR  OTALKSPA  OTALKFRE  OTALKGER  ONEWSFRE  ONEWSSPA
ONEWSGER  OSPREDBG  OLONGLOG
);

if ($no_asm) {
push (@c_files, qw(
I_BAR   IB_TRD IB_A    IC       IC_R     CRC      IJ_T
IB_T    I_READ I_EMASK IB_TD    I_EREMAP IB_ATRD IB_AT    IB_32
IB_ATD  IB_R   IB      IR_BAR   IB2      I_LINE  IB_ATR   IB_AR
IB_TR   IB_DW  I_PIXEL I_FREMAP I_BLACK  I_SNOW  IB_ATRDM IB_TRDM
IB_ATDM IR_AM  IR_A    IB_TDM   IR_M IR
));
}

# USE_DPLAY
# OREMOTE
# OREMOTE2
# OREMOTEM
# OREMOTEQ
# OERRCTRL
# ODPLAY
# OCRC_STO
# OGAMEMP

@defines = qw( AMPLUS );
if (defined($debug) && $debug) {
  push (@defines, "DEBUG");
}
if (defined($no_asm) && $no_asm) {
  push (@defines, "NO_ASM");
}

@includes = qw( ../../include );

if (defined($wine_prefix)) {
  push (@includes, "$wine_prefix/include/wine/windows",
                   "$wine_prefix/include/wine/msvcrt");
}

if (defined($dxsdk_path)) {
  push (@includes, "$dxsdk_path/include");
}

### Resources ###
@rc_files = qw(
ico
);

### Linking targets ###
@obj_files = map { "$_.o" } @c_files;
unless ($no_asm) {
my @asm_obj_files = qw(
I_BAR   IB_TRD IB_A    IC       IC_R     CRC     IJ_T
IB_T    I_READ I_EMASK IB_TD    I_EREMAP IB_ATRD IB_AT    IB_32
IB_ATD  IB_R   IB      IR_BAR   IB2      I_LINE  IB_ATR   IB_AR
IB_TR   IB_DW  I_PIXEL I_FREMAP I_BLACK  I_SNOW  IB_ATRDM IB_TRDM
IB_ATDM IR_AM  IR_A    IB_TDM   IR_M IR
);
push ( @obj_files, map { "asm/$_.o" } @asm_obj_files );
}
push ( @obj_files, map { "$_.o" } @rc_files );

@common_c_files = qw(
OMEM
);
push ( @obj_files, map { "../common/$_.o" } @common_c_files );

if (defined($debug) && $debug) {
  push ( @obj_files, "../common/dbglog.o" );
}

@libs = qw(
  gdi32 ddraw msvcrt ole32 dinput dsound winmm
);

if (defined($dxsdk_path)) {
  push (@lib_dirs, "$dxsdk_path/lib");
}

$exe = '7kaa.exe';
