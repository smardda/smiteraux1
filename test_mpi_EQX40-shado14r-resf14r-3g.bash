#!/bin/bash
set -e
# MPI test for smardda-pfc.
# Assumes software installed under directory HS
# HSAUX points to auxiliary geometry and equilibrium files needed in testing
# The test output will be created in a subdirectory of $HSAUX.
# This script is specific to the Test-EQX40-shado14r-resf14r-3g regression-test case.
# It can also be used as an example/template for preparing and running a
# monolithic SMITER case under MPI, either on a local system or from a
# Slurm job, but it is not a generic runner for a new SMARDDA case.
# However the script is written using variables such as equid, gshad, gres, no, bdry,
# decl, pow, and cal so that the logic of the case is explicit.
# If another similar regression-test case is needed, these variables are the
# main names to change. The rest of the script then generates the corresponding
# S, G, H, and P control files and links the corresponding EQDSK and VTK files.
#
# If SMITER_DIR is defined, use it as the SMARDDA-PFC installation directory.
# Otherwise, use the old default location $HOME/smardda-pfc.

if [[ -n "$SMITER_DIR" ]] ; then HS=$SMITER_DIR; else HS=$HOME/smardda-pfc; fi
export HS

# Auxiliary directory with geometry and equilibrium files
# If HSAUX is not already defined, use the current directory.
#
# When this script is run from smiteraux, this means:
#   HSAUX=$SMITER_DIR/smiteraux

if [[ -z "$HSAUX" ]] ; then export HSAUX=$PWD ; fi

# Set up paths to the input data and templates.
#
# equil contains equilibrium files, for example:
#   $HSAUX/Data/Equilibrium/EQX40.eqdsk
#
# geom contains VTK geometry files, for example:
#   $HSAUX/Data/VTK/shado14r.vtk
#   $HSAUX/Data/VTK/resf14r.vtk
#
# extra contains generic .ctl templates, for example:
#   $HS/Extras/SHAD3x.ctl
#   $HS/Extras/RES3x.ctl
#   $HS/Extras/HDS3.ctl
#   $HS/Extras/POW3g.ctl

equil=$HSAUX/Data/Equilibrium
geom=$HSAUX/Data/VTK
extra=$HS/Extras

echo "The MPI test will assume that SMARDDA-PFC is installed in directory HS =" $HS
echo "Auxiliary data assumed installed in directory HSAUX " $HSAUX
echo "The MPI test output will appear in sub-directories of " $HSAUX

if [ ! -d "$extra" ] ; then
  echo "Directory $extra not found, quitting"
  echo "Check environment variables HS and HSAUX are set correctly"
  exit 1
fi

# Start monolithic testing: Test EQX40-shado14r-resf14r-3g
# This is the MPI version of the regression-test case.

echo "******Start of single MPI test case  "

# case_dir is the name of the new run directory created by this script.
# The suffix _MPI is used to distinguish this MPI run from the original
# regression-test directory.

case_dir=Test-EQX40-shado14r-resf14r-3g_MPI

# run_dir is the full path where the MPI test will be run.

run_dir=$HSAUX/$case_dir

# equid is the base name of the equilibrium.
# eqfile is the actual EQDSK file used by the test.
# eqsuff extracts the file extension, here: eqdsk.
#
# Later the script links:
#   $HSAUX/Data/Equilibrium/EQX40.eqdsk
# into the run directory as:
#   EQX40.eqdsk

equid=EQX40
eqfile=EQX40.eqdsk
eqsuff=${eqfile##*.}

# gshad is the base name of the shadow/input VTK geometry.
# It corresponds to:
#   $HSAUX/Data/VTK/shado14r.vtk
#
# gres is the base name of the result/target VTK geometry.
# It corresponds to:
#   $HSAUX/Data/VTK/resf14r.vtk

gshad=shado14r
gres=resf14r


# Parameters used to select the generic .ctl templates and to replace
# placeholders inside them.
#
# no=3 and bdry=x select:
#   SHAD3x.ctl
#   RES3x.ctl
#
# no=3 selects:
#   HDS3.ctl
#
# no=3 and cal=g select:
#   POW3g.ctl
#
# decl and pow are inserted into the POW control file.

bdry=x
decl=0.011
pow=16.64
no=3
cal=g

echo " Executing MPI test EQX40-shado14r-resf14r-3g in directory " $run_dir

# Create directories for monolithic run of smiter
#
# Remove any previous run directory with the same name, then create:
#   S/  for the geometry shadow control file
#   G/  for the geometry result control file
#   H/  for the hdsgen control file
#   P/  for the powcal control file

rm -rf "$run_dir"
mkdir -p "$run_dir"/{S,G,H,P}

# Move into the run directory.
# From this point, all generated .ctl files and linked input files are created
# inside $run_dir.
cd "$run_dir"

# ---- Generate CTLs -----
# Create case-specific control files from the generic templates
# by replacing placeholder names with the actual names
#
# The templates are in:
#   $HS/Extras
#
# The generated control files are written in the run directory, inside:
#   S/
#   G/
#   H/
#   P/
#
# These four control files are later passed to the monolithic smiter executable.
# S: shadow ctl
#
# Template used:
#   $extra/SHAD${no}${bdry}.ctl
#
# With no=3 and bdry=x, this becomes:
#   $extra/SHAD3x.ctl
#
# Placeholder replacements:
#   EQDSK.eqdsk -> EQX40.eqdsk
#   SHAD        -> shado14r
#
# Generated file:
#   S/shado14r.ctl
#
# It reads the template $HS/Extras/SHAD3x.ctl, replaces inside it :
# EQDSK.eqdsk  →  EQX40.eqdsk
# SHAD         →  shado14r
# and writes the results in S/shado14r.ctl

sed -e "s/EQDSK.eqdsk/$equid.$eqsuff/" -e "s/SHAD/$gshad/" \
  < "$extra/SHAD${no}${bdry}.ctl" > "S/$gshad.ctl"


#G: result ctl
#
# Template used:
#   $extra/RES${no}${bdry}.ctl
#
# With no=3 and bdry=x, this becomes:
#   $extra/RES3x.ctl
#
# Placeholder replacements:
#   EQDSK.eqdsk -> EQX40.eqdsk
#   RES         -> resf14r
#
# Generated file:
#   G/resf14r.ctl

sed -e "s/EQDSK.eqdsk/${equid}.${eqsuff}/" -e "s/RES/${gres}/" \
  < "$extra/RES${no}${bdry}.ctl" > "G/${gres}.ctl"


#H: hdsgen ctl
#
# Template used:
#   $extra/HDS${no}.ctl
#
# With no=3, this becomes:
#   $extra/HDS3.ctl
#
# Placeholder replacement:
#   SHAD -> shado14r
#
# Generated file:
#   H/shado14r.ctl

sed -e "s/SHAD/${gshad}/"  \
  < "$extra/HDS${no}.ctl" > "H/${gshad}.ctl"

#P: powcal ctl
#
# Template used:
#   $extra/POW${no}${cal}.ctl
#
# With no=3 and cal=g, this becomes:
#   $extra/POW3g.ctl
#
# Placeholder replacements:
#   SHAD -> shado14r
#   RES  -> resf14r
#   DECL -> 0.011
#   POW  -> 16.64
#
# Generated file:
#   P/resf14r.ctl

sed -e "s/SHAD/${gshad}/" -e "s/RES/${gres}/"  -e "s/DECL/${decl}/" -e "s/POW/${pow}/" \
  < "$extra/POW${no}${cal}.ctl" > "P/${gres}.ctl"

# Fix relative paths for smiter monolithic run from top dir
#
# smiter is launched from:
#   $run_dir
#
# Therefore paths inside H/${gshad}.ctl and P/${gres}.ctl must refer to:
#   S/
#   G/
#   H/
#
# This replaces:
#   ../S/ or ./S/ with S/
#   ../G/ or ./G/ with G/
#   ../H/ or ./H/ with H/
#
# Files modified in place:
#   H/shado14r.ctl
#   P/resf14r.ctl

sed -i \
  -e "s#\.\./S/#S/#g" -e "s#\./S/#S/#g" \
  -e "s#\.\./G/#G/#g" -e "s#\./G/#G/#g" \
  -e "s#\.\./H/#H/#g" -e "s#\./H/#H/#g"\
  "H/${gshad}.ctl" "P/${gres}.ctl"



# Linking input files into the run directory
#
# The input files are not copied. They are linked into the run directory.
#
# Equilibrium file:
#   source: $HSAUX/Data/Equilibrium/EQX40.eqdsk
#   link:   EQX40.eqdsk
#
# VTK geometry files:
#   source: $HSAUX/Data/VTK/shado14r.vtk
#   link:   shado14r.vtk
#
#   source: $HSAUX/Data/VTK/resf14r.vtk
#   link:   resf14r.vtk

echo "Linking inputs ..."
ln -sf "$equil/${eqfile}" "${equid}.${eqsuff}"
ln -sf "$geom/${gshad}.vtk" "${gshad}.vtk"
ln -sf "$geom/${gres}.vtk" "${gres}.vtk"

ls -l "${equid}.${eqsuff}" "${gshad}.vtk" "${gres}.vtk"


# ---- MPI Run ----
#
# Run the monolithic smiter executable with MPI.
#
# If the script is run inside a Slurm job, SLURM_NTASKS is defined by Slurm.
# In that case, use the number of MPI processes allocated by Slurm and
# launch the test with mpirun.
#
# If the script is run outside Slurm, use 4 MPI processes by default  and
# launch the test with mpiexec.
#
# The four control files passed to smiter are:
#   S/shado14r.ctl
#   G/resf14r.ctl
#   H/shado14r.ctl
#   P/resf14r.ctl
#
# For a new case, this MPI launch structure can be reused, but the control-file
# names and input files must be changed to the new case names.
#

NP=${SLURM_NTASKS:-4}
echo "Using NP = $NP MPI processes"

if [[ -n "$SLURM_NTASKS" ]]; then
    echo "Running under Slurm with $SLURM_NTASKS MPI processes"
    # mpirun -np "$NP" --bind-to core --map-by core \
     mpirun -np "$NP"  \
        "$HS/exec/smiter" \
        "S/${gshad}.ctl" \
        "G/${gres}.ctl" \
        "H/${gshad}.ctl" \
        "P/${gres}.ctl"
else
    echo "Running locally with  $NP MPI processes"
    mpiexec -np "$NP" \
    "$HS/exec/smiter" \
    S/${gshad}.ctl \
    G/${gres}.ctl \
    H/${gshad}.ctl \
    P/${gres}.ctl
fi
