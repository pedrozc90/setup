#!/bin/bash

SOURCE="/mnt/c/Blizzard/World of Warcraft/_retail_/WTF/Account/MANABI/SavedVariables/LuaUI.lua"
DEST="data.lua"

cat "$SOURCE" | sed -e 's/LuaUIData/local LuaUIData/g' > $DEST
echo "return LuaUIData" >> $DEST