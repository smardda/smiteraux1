#! /bin/bash
# remove all testdeck outputs from smardda-pfc test-deck
# tests.bash places these in directory $HSAUX
#
if [[ -z "$HSAUX" ]] ; then HSAUX=$PWD ; fi
cd $HSAUX
echo "Cleaning up" $HSAUX
rm -f Data/Geometry/beancan.log
rm -f Data/Geometry/beancansy.log
rm -f Data/Geometry/dome_outrefl_skeleton_july2012.log
rm -f Data/Geometry/dome_outrefl_skeleton_july2012sy.log
rm -f Data/Geometry/fw18.log
rm -f Data/Geometry/fw18sy.log
rm -f Data/Geometry/FW2.log
rm -f Data/Geometry/FW3.log
rm -f Data/Geometry/FW4.log
rm -f Data/Geometry/FW5.log
rm -f Data/Geometry/FW6.log
rm -f Data/Geometry/.STOP-F11-fw264t-fw4t
rm -f Data/Geometry/.STOP-vde-bot-baf
rm -f Data/Geometry/.STOP-vde-botsy-baf
rm -f Data/Geometry/wdfd03_shaped_mesh10mm.log
rm -f Data/Geometry/wdpdd06_mesh10mm_onlyfront.log
rm -f Data/Geometry/wdpdd06_mesh30mm.log
rm -f Data/VTK/baf.log
rm -f Data/VTK/baf.vtk
rm -f Data/VTK/beancansy.vtk
rm -f Data/VTK/beancan.vtk
rm -f Data/VTK/bot.log
rm -f Data/VTK/botsy.log
rm -f Data/VTK/botsy.vtk
rm -f Data/VTK/bot.vtk
rm -f Data/VTK/dome_outrefl_skeleton_july2012sy.vtk
rm -f Data/VTK/dome_outrefl_skeleton_july2012.vtk
rm -f Data/VTK/fw18sy.vtk
rm -f Data/VTK/fw18.vtk
rm -f Data/VTK/fw264t.log
rm -f Data/VTK/fw264t.vtk
rm -f Data/VTK/FW2.vtk
rm -f Data/VTK/FW3.vtk
rm -f Data/VTK/fw4t.log
rm -f Data/VTK/fw4t.vtk
rm -f Data/VTK/FW4.vtk
rm -f Data/VTK/FW5.vtk
rm -f Data/VTK/FW6.vtk
rm -f Data/VTK/.STOP-F11-fw264t-fw4t
rm -f Data/VTK/.STOP-vde-bot-baf
rm -f Data/VTK/.STOP-vde-botsy-baf
rm -f Data/VTK/wdfd03_shaped_mesh10mm.vtk
rm -f Data/VTK/wdpdd06_mesh10mm_onlyfront.vtk
rm -f Data/VTK/wdpdd06_mesh30mm_tfm1.log
rm -f Data/VTK/wdpdd06_mesh30mm_tfm1.vtk
rm -f Data/VTK/wdpdd06_mesh30mm.vtk
rm -rf  ismtemp*
rm -rf  Test-EQ3-inrshad1-inres1
rm -rf  Test-EQX40-shado14r-resf14r
rm -rf  Test-EQX40-shado14r-resf14r-3g
rm -rf  Test-MNEW8-sha12-res12
rm -rf  Val-F11-fw264t-fw4t
rm -rf  Val-F11-fw264t-fw4t-1l
rm -rf  Val-vde-bot-baf
rm -rf  Val-vde-botsy-baf
rm -rf  Val-HR-bott-baff
rm -rf  Val-smanal-mjg
