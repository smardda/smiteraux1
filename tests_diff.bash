#! /bin/bash
# diff all testdeck outputs from SMARDDA/PFC test-deck
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
diff -b Data/Geometry/beancan.log $HSAOLD/Data/Geometry/beancan.log
echo "Data/Geometry/beancansy.log"
diff -b Data/Geometry/beancansy.log $HSAOLD/Data/Geometry/beancansy.log
echo "Data/Geometry/dome_outrefl_skeleton_july2012.log"
diff -b Data/Geometry/dome_outrefl_skeleton_july2012.log $HSAOLD/Data/Geometry/dome_outrefl_skeleton_july2012.log
echo "Data/Geometry/dome_outrefl_skeleton_july2012sy.log"
diff -b Data/Geometry/dome_outrefl_skeleton_july2012sy.log $HSAOLD/Data/Geometry/dome_outrefl_skeleton_july2012sy.log
echo "Data/Geometry/fw18.log"
diff -b Data/Geometry/fw18.log $HSAOLD/Data/Geometry/fw18.log
echo "Data/Geometry/fw18sy.log"
diff -b Data/Geometry/fw18sy.log $HSAOLD/Data/Geometry/fw18sy.log
echo "Data/Geometry/FW2.log"
diff -b Data/Geometry/FW2.log $HSAOLD/Data/Geometry/FW2.log
echo "Data/Geometry/FW3.log"
diff -b Data/Geometry/FW3.log $HSAOLD/Data/Geometry/FW3.log
echo "Data/Geometry/FW4.log"
diff -b Data/Geometry/FW4.log $HSAOLD/Data/Geometry/FW4.log
echo "Data/Geometry/FW5.log"
diff -b Data/Geometry/FW5.log $HSAOLD/Data/Geometry/FW5.log
echo "Data/Geometry/FW6.log"
diff -b Data/Geometry/FW6.log $HSAOLD/Data/Geometry/FW6.log
echo "Data/Geometry/.STOP-F11-fw264t-fw4t"
diff -b Data/Geometry/.STOP-F11-fw264t-fw4t $HSAOLD/Data/Geometry/.STOP-F11-fw264t-fw4t
echo "Data/Geometry/.STOP-vde-bot-baf"
diff -b Data/Geometry/.STOP-vde-bot-baf $HSAOLD/Data/Geometry/.STOP-vde-bot-baf
echo "Data/Geometry/.STOP-vde-botsy-baf"
diff -b Data/Geometry/.STOP-vde-botsy-baf $HSAOLD/Data/Geometry/.STOP-vde-botsy-baf
echo "Data/Geometry/wdfd03_shaped_mesh10mm.log"
diff -b Data/Geometry/wdfd03_shaped_mesh10mm.log $HSAOLD/Data/Geometry/wdfd03_shaped_mesh10mm.log
echo "Data/Geometry/wdpdd06_mesh10mm_onlyfront.log"
diff -b Data/Geometry/wdpdd06_mesh10mm_onlyfront.log $HSAOLD/Data/Geometry/wdpdd06_mesh10mm_onlyfront.log
echo "Data/Geometry/wdpdd06_mesh30mm.log"
diff -b Data/Geometry/wdpdd06_mesh30mm.log $HSAOLD/Data/Geometry/wdpdd06_mesh30mm.log
echo "Data/VTK/baf.log"
diff -b Data/VTK/baf.log $HSAOLD/Data/VTK/baf.log
echo "Data/VTK/baf.vtk"
diff -b Data/VTK/baf.vtk $HSAOLD/Data/VTK/baf.vtk
echo "Data/VTK/beancansy.vtk"
diff -b Data/VTK/beancansy.vtk $HSAOLD/Data/VTK/beancansy.vtk
echo "Data/VTK/beancan.vtk"
diff -b Data/VTK/beancan.vtk $HSAOLD/Data/VTK/beancan.vtk
echo "Data/VTK/bot.log"
diff -b Data/VTK/bot.log $HSAOLD/Data/VTK/bot.log
echo "Data/VTK/botsy.log"
diff -b Data/VTK/botsy.log $HSAOLD/Data/VTK/botsy.log
echo "Data/VTK/botsy.vtk"
diff -b Data/VTK/botsy.vtk $HSAOLD/Data/VTK/botsy.vtk
echo "Data/VTK/bot.vtk"
diff -b Data/VTK/bot.vtk $HSAOLD/Data/VTK/bot.vtk
echo "Data/VTK/dome_outrefl_skeleton_july2012sy.vtk"
diff -b Data/VTK/dome_outrefl_skeleton_july2012sy.vtk $HSAOLD/Data/VTK/dome_outrefl_skeleton_july2012sy.vtk
echo "Data/VTK/dome_outrefl_skeleton_july2012.vtk"
diff -b Data/VTK/dome_outrefl_skeleton_july2012.vtk $HSAOLD/Data/VTK/dome_outrefl_skeleton_july2012.vtk
echo "Data/VTK/fw18sy.vtk"
diff -b Data/VTK/fw18sy.vtk $HSAOLD/Data/VTK/fw18sy.vtk
echo "Data/VTK/fw18.vtk"
diff -b Data/VTK/fw18.vtk $HSAOLD/Data/VTK/fw18.vtk
echo "Data/VTK/fw264t.log"
diff -b Data/VTK/fw264t.log $HSAOLD/Data/VTK/fw264t.log
echo "Data/VTK/fw264t.vtk"
diff -b Data/VTK/fw264t.vtk $HSAOLD/Data/VTK/fw264t.vtk
echo "Data/VTK/FW2.vtk"
diff -b Data/VTK/FW2.vtk $HSAOLD/Data/VTK/FW2.vtk
echo "Data/VTK/FW3.vtk"
diff -b Data/VTK/FW3.vtk $HSAOLD/Data/VTK/FW3.vtk
echo "Data/VTK/fw4t.log"
diff -b Data/VTK/fw4t.log $HSAOLD/Data/VTK/fw4t.log
echo "Data/VTK/fw4t.vtk"
diff -b Data/VTK/fw4t.vtk $HSAOLD/Data/VTK/fw4t.vtk
echo "Data/VTK/FW4.vtk"
diff -b Data/VTK/FW4.vtk $HSAOLD/Data/VTK/FW4.vtk
echo "Data/VTK/FW5.vtk"
diff -b Data/VTK/FW5.vtk $HSAOLD/Data/VTK/FW5.vtk
echo "Data/VTK/FW6.vtk"
diff -b Data/VTK/FW6.vtk $HSAOLD/Data/VTK/FW6.vtk
echo "Data/VTK/.STOP-F11-fw264t-fw4t"
diff -b Data/VTK/.STOP-F11-fw264t-fw4t $HSAOLD/Data/VTK/.STOP-F11-fw264t-fw4t
echo "Data/VTK/.STOP-vde-bot-baf"
diff -b Data/VTK/.STOP-vde-bot-baf $HSAOLD/Data/VTK/.STOP-vde-bot-baf
echo "Data/VTK/.STOP-vde-botsy-baf"
diff -b Data/VTK/.STOP-vde-botsy-baf $HSAOLD/Data/VTK/.STOP-vde-botsy-baf
echo "Data/VTK/wdfd03_shaped_mesh10mm.vtk"
diff -b Data/VTK/wdfd03_shaped_mesh10mm.vtk $HSAOLD/Data/VTK/wdfd03_shaped_mesh10mm.vtk
echo "Data/VTK/wdpdd06_mesh10mm_onlyfront.vtk"
diff -b Data/VTK/wdpdd06_mesh10mm_onlyfront.vtk $HSAOLD/Data/VTK/wdpdd06_mesh10mm_onlyfront.vtk
echo "Data/VTK/wdpdd06_mesh30mm_tfm1.log"
diff -b Data/VTK/wdpdd06_mesh30mm_tfm1.log $HSAOLD/Data/VTK/wdpdd06_mesh30mm_tfm1.log
echo "Data/VTK/wdpdd06_mesh30mm_tfm1.vtk"
diff -b Data/VTK/wdpdd06_mesh30mm_tfm1.vtk $HSAOLD/Data/VTK/wdpdd06_mesh30mm_tfm1.vtk
echo "Data/VTK/wdpdd06_mesh30mm.vtk"
diff -b Data/VTK/wdpdd06_mesh30mm.vtk $HSAOLD/Data/VTK/wdpdd06_mesh30mm.vtk
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
