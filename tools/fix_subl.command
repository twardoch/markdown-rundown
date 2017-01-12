#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

# current workaround for homebrew bug
file=$HOME'/.pydistutils.cfg'
touch $file

/bin/cat <<EOM >$file
[install]
prefix=
EOM
# end of current workaround for homebrew bug

PREFIX="$HOME/Library/Application Support/Sublime Text 3/Packages/OmniMarkupPreviewer/OmniMarkupLib/Renderers/libs"
pip install --ignore-installed --upgrade --target="$PREFIX" -r ../requirements.txt

# current workaround for homebrew bug
rm -rf $file
# end of current workaround for homebrew bug

open "$PREFIX"