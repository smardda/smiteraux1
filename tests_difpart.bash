#! /bin/bash
# diff principal testdeck outputs from SMARDDA/PFC test-deck
# tests.bash places latest in directory $HSAUX
# compare with outputs in "$HSAUX"_old
#
if [[ -z "$HSAUX" ]] ; then HSAUX=$PWD ; fi
if [[ -z "$HSAOLD" ]] ; then HSAOLD="$HSAUX"_old ; fi
if [ ! -d $HSAOLD ] ; then
  echo "Previous directory \$HSAOLD=$HSAOLD does not exist, try different \$HSAOLD "
  echo "Script quitting"; exit
fi
cd $HSAUX
echo "Differencing " $HSAUX " with " $HSAOLD
echo "Data/Geometry/beancan.log"
diff -b Data/Geometry/beancan.log $HSAOLD/beancan.log
echo "Data/Geometry/beancansy.log"
diff -b Data/Geometry/beancansy.log $HSAOLD/beancansy.log
echo "Data/Geometry/dome_outrefl_skeleton_july2012.log"
diff -b Data/Geometry/dome_outrefl_skeleton_july2012.log $HSAOLD/dome_outrefl_skeleton_july2012.log
echo "Data/Geometry/dome_outrefl_skeleton_july2012sy.log"
diff -b Data/Geometry/dome_outrefl_skeleton_july2012sy.log $HSAOLD/dome_outrefl_skeleton_july2012sy.log
echo "Data/Geometry/fw18.log"
diff -b Data/Geometry/fw18.log $HSAOLD/fw18.log
echo "Data/Geometry/fw18sy.log"
diff -b Data/Geometry/fw18sy.log $HSAOLD/fw18sy.log
echo "Data/Geometry/FW2.log"
diff -b Data/Geometry/FW2.log $HSAOLD/FW2.log
echo "Data/Geometry/FW3.log"
diff -b Data/Geometry/FW3.log $HSAOLD/FW3.log
echo "Data/Geometry/wdfd03_shaped_mesh10mm.log"
diff -b Data/Geometry/wdfd03_shaped_mesh10mm.log $HSAOLD/wdfd03_shaped_mesh10mm.log
echo "Data/Geometry/wdpdd06_mesh10mm_onlyfront.log"
diff -b Data/Geometry/wdpdd06_mesh10mm_onlyfront.log $HSAOLD/wdpdd06_mesh10mm_onlyfront.log
echo "Data/Geometry/wdpdd06_mesh30mm.log"
diff -b Data/Geometry/wdpdd06_mesh30mm.log $HSAOLD/wdpdd06_mesh30mm.log
echo "Data/VTK/baf.log"
diff -b Data/VTK/baf.log $HSAOLD/baf.log
echo "Data/VTK/bot.log"
diff -b Data/VTK/bot.log $HSAOLD/bot.log
echo "Data/VTK/wdpdd06_mesh30mm_tfm1.log"
diff -b Data/VTK/wdpdd06_mesh30mm_tfm1.log $HSAOLD/wdpdd06_mesh30mm_tfm1.log
echo "Test-EQ3-inrshad1-inres1"
diff -rb  Test-EQ3-inrshad1-inres1 $HSAOLD/Test-EQ3-inrshad1-inres1
echo "Test-EQX40-shado14r-resf14r"
diff -rb  Test-EQX40-shado14r-resf14r $HSAOLD/Test-EQX40-shado14r-resf14r
echo "Test-EQX40-shado14r-resf14r-3g"
diff -rb  Test-EQX40-shado14r-resf14r-3g $HSAOLD/Test-EQX40-shado14r-resf14r-3g
echo "Test-MNEW8-sha12-res12"
diff -rb  Test-MNEW8-sha12-res12 $HSAOLD/Test-MNEW8-sha12-res12
echo "Val-F11-fw264t-fw4t"
diff -rb  Val-F11-fw264t-fw4t $HSAOLD/Val-F11-fw264t-fw4t
echo "Val-F11-fw264t-fw4t-1l"
diff -rb  Val-F11-fw264t-fw4t-1l $HSAOLD/Val-F11-fw264t-fw4t-1l
echo "Val-vde-bot-baf"
diff -rb  Val-vde-bot-baf $HSAOLD/Val-vde-bot-baf
echo "Val-vde-botsy-baf"
diff -rb  Val-vde-botsy-baf $HSAOLD/Val-vde-botsy-baf
echo "Val-HR-bott-baff"
diff -rb  Val-HR-bott-baff $HSAOLD/Val-HR-bott-baff
echo "Val-smanal-mjg"
diff -rb  Val-smanal-mjg $HSAOLD/Val-smanal-mjg
