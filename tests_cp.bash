#! /bin/bash
# move all testdeck outputs from smardda-pfc test-deck
# tests.bash places latest in directory $HSAUX
# overwrite outputs in "$HSAUX"_old
#
if [[ -z "$HSAUX" ]] ; then HSAUX=$PWD ; fi
if [[ -z "$HSAOLD" ]] ; then HSAOLD="$HSAUX"_old ; fi
if [ ! -d $HSAOLD ] ; then
  mkdir $HSAOLD
  echo "Creating directory \$HSAOLD=$HSAOLD"
fi
cd $HSAUX
echo "Syncing " $HSAUX " with " $HSAOLD
rsync -av $HSAUX/  $HSAOLD/
