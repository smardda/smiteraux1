#! /bin/bash
# testdeck for smardda-pfc, assumes software installed under directory HS
# HSAUX points to auxilliary geometry and equilibrium files needed in testing
# The test outputs will go in directory $HSAUX.
#
if [[ -n "$SMITER_DIR" ]] ; then HS=$SMITER_DIR; else HS=$HOME/smardda-pfc; fi
export HS
#auxilliary directory with geometry and equilibrium files
# created using
# tar cvf smiteraux.tar --exclude=Test-* --exclude=ismtemp* --exclude=Val-* $HSAUX
if [[ -z "$HSAUX" ]] ; then export HSAUX=$PWD ; fi
#set up soft links to HSAUX
equil=$HSAUX/Data/Equilibrium
geom=$HSAUX/Data/VTK
extra=$HS/Extras
echo "Test-deck will assume that SMARDDA-PFC is installed in directory HS =" $HS
echo "Auxilliary data assumed installed in directory HSAUX " $HSAUX
echo "Test-deck output will appear in sub-directories of " $HSAUX
if [ ! -d $extra ] ; then
  echo "Directory $extra not found, quitting"
  echo "Check environment variables HS and HSAUX are set correctly"
  exit
fi
# start testing
echo "Executing test deck in directory " $HSAUX
cd $extra
# Test 1
echo "******Start of  Test 1"
./tes.sgo flds=1 cal=l eqfile=EQ3.eqdsk eqid=EQ3  \
gres=inres1 gshad=inrshad1 bdry=in decl=0.012 pow=7.5
if [ $? == 2 ] ; then
  echo "SMARDDA-PFC auxilliary data not where expected, quitting" 
  echo "Check environment variables HS and HSAUX are set correctly"
  exit
fi
# Test 2
echo "******Start of  Test 2"
./tes.sgo flds=2 cal=g eqfile=ose_8.equ eqid=MNEW8  \
vfld=testov5 gres=res12 gshad=sha12 bdry=x decl=0.01  \
pow=1.0 gwall=mwall
# Test 3 (defaults)
echo "******Start of  Test 3 (defaults)"
./tes.sgo flds=3 cal=g eqfile=EQX40.eqdsk eqid=EQX40  \
gres=resf14r gshad=shado14r bdry=x decl=0.011 pow=16.64
# rename
cd $HSAUX
mv Test-EQX40-shado14r-resf14r Test-EQX40-shado14r-resf14r-3g
cd $extra
# Test 3 old 
echo "******Start of  Test 3 old "
./tes.sgo flds=1 cal=l eqfile=EQX40.eqdsk eqid=EQX40  \
gres=resf14r gshad=shado14r bdry=x decl=0.011 pow=16.64
#
#
# Validation Test 1 (defaults)
echo "******Start of Validation Test 1 (defaults)"
./val1.sgo flds=1 cal=l eqfile=16_97s.eqdsk eqid=F11  \
gdatshad=FW2+FW3+FW4+FW5+FW6 gdatres=FW4 gres=fw4t gshad=fw264t bdry=in  \
decl=0.05 pow=5.
# rename
cd $HSAUX
mv Val-F11-fw264t-fw4t Val-F11-fw264t-fw4t-1l
cd $extra
# Validation Test 1 as global
echo "******Start of Validation Test 1 as global"
./val1.sgo flds=3 cal=g eqfile=16_97s.eqdsk eqid=F11  \
gdatshad=FW2+FW3+FW4+FW5+FW6 gdatres=FW4 gres=fw4t gshad=fw264t bdry=in  \
decl=0.05 pow=5.
# Validation Test 2 (defaults)
echo "******Start of Validation Test 2 (defaults)"
./val3.sgo flds=3 cal=g eqfile=VDE_DW_li0.6_715ms.eqdsk \
eqid=vde gdatctl=dome_outrefl_skeleton_july2012+fw18+beancan   \
gdatshad=wdpdd06_mesh30mm gdatres=wdpdd06_mesh10mm_onlyfront gres=baf  \
gshad=bot bdry=out decl=0.03 pow=159.
# Validation Test 2 on 60deg 
echo "******Start of Validation Test 2 on 60deg "
./val3.sgo flds=3 cal=g eqfile=VDE_DW_li0.6_715ms.eqdsk \
eqid=vde gdatctl=dome_outrefl_skeleton_july2012sy+fw18sy+beancansy   \
gdatshad=wdpdd06_mesh30mm gdatres=wdpdd06_mesh10mm_onlyfront gres=baf  \
gshad=botsy bdry=out decl=0.03 pow=159. nzetp=6
# Validation Test 3 
echo "******Start of Validation Test 3 "
./val4.sgo flds=3 cal=g eqfile=g900003_00230_ITER_15MA_eqdsk16HR.txt \
eqid=HR gdatctl=dome_outrefl_skeleton_july2012+fw18+beancan   \
gdatshad=wdfd03_shaped_mesh10mm gdatres=wdfd03_shaped_mesh10mm gres=baff \
gshad=bott bdry=out decl=0.03 pow=159. nzetp=18
# smanal test
echo "******Smanal Test on pre-existing output files "
runid=mjg
rundir=$HSAUX/Val-smanal-$runid
## scratch directory for script
tempdir=$HSAUX/ismtemp$$
echo "Start script" $(date)
echo "rundir = " $rundir
echo "tempdir = " $tempdir
## Input OK and logged, start by creating $tempdir
if [ ! -d $tempdir ] ; then rm -f $tempdir; mkdir $tempdir;fi
## Make sure run directory exists
if [ ! -d $rundir ] ; then rm -f $rundir;mkdir $rundir;fi;cd $rundir
## directory for interactive scripts
INT=$HS/int
## This directory is part of the smardda-pfc installation
geom=$HSAUX/Data/VTK
cp $geom/mjg.ctl .
cp $geom/mjgx9r_powx.vtk .
cp $geom/mjgx9r.vtk .
$INT/cmdwrap $tempdir smanal $runid
if [ $? -ne 0 ] ; then exit 1 ;fi
#  Create tar file containing power deposition results
tar cvf smiteraux1.tar $(find [TV]* -name "*_powx.vtk") 
