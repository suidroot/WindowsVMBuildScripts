#!/bin/sh


GHIDRA_SCRIPTS="$HOME/test/ghidra_scripts"
GHIDRA_TEMP="ghidra_temp"

declare -a REPOS=(
	"https://github.com/AllsafeCyberSecurity/LazyGhidra"
	"https://github.com/reb311ion/replica"
	"https://github.com/schlafwandler/ghidra_ExportToX64dbg"
	"https://github.com/d3v1l401/FindCrypt-Ghidra"
)

#echo "curr dir $PWD"
mkdir -p "$PWD/$GHIDRA_TEMP"
cd "$PWD/$GHIDRA_TEMP"
WORKING_DIR=$PWD
#echo "Work Dir: $WORKING_DIR"

for repo in "${REPOS[@]}"
do
	echo "Closing Repo $repo"
	git clone "$repo"
done

# LazyGhidra
cp $WORKING_DIR/LazyGhidra/scripts/*.py $GHIDRA_SCRIPTS

# replica
cp $WORKING_DIR/replica/data.py $GHIDRA_SCRIPTS
cp $WORKING_DIR/replica/db.7z $GHIDRA_SCRIPTS
cp $WORKING_DIR/replica/replica.png $GHIDRA_SCRIPTS
cp $WORKING_DIR/replica/replica.py $GHIDRA_SCRIPTS

cd $GHIDRA_SCRIPTS
7z e db.7z


# ghidra_ExportToX64dbg
cp $WORKING_DIR/ghidra_ExportToX64dbg/*.py $GHIDRA_SCRIPTS

# FindCrypt-Ghidra
cp $WORKING_DIR/FindCrypt-Ghidra/FindCrypt.java $GHIDRA_SCRIPTS
cp -R $WORKING_DIR/FindCrypt-Ghidra/findcrypt_ghidra $HOME

# Clean up
rm -rf $WORKING_DIR