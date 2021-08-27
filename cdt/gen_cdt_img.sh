#!/bin/sh

if [ "$#" != 1 ];then
    echo "gen_cdt_img.sh ~/share_data/qcs610_img/qcs610_rasp"
    exit 0
fi
dest_src=$1

python ptool.py -x partition_emmc.xml -gpt 2

echo "start copy file for cdt ..."
cp -f rawprogram2.xml $dest_src
cp -f patch2.xml $dest_src
cp -f gpt_main2.bin $dest_src
cp -f gpt_backup2.bin $dest_src
cp -f cdt_array.bin $dest_src
echo "copy done!"
