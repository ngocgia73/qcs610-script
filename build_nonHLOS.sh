#!/bin/sh

if [ "$#" != 2 ];then
    echo "wrong parameter ... "
    echo ./build_nonHLOS.sh true true
    exit 0
fi

is_build_adsp=$1
echo "is_buildadsp=$1"
is_build_cdsp=$2
echo "is_build_cdsp=$2"

echo "starting build nonHLOS"
ws_dir=$PWD
echo "workspace directory is $ws_dir"

echo "build boot_image ..."
cd $ws_dir/boot_images/QcomPkg/Tools

python cdt_generator.py cdp_0_1.0.xml cdt_array.bin

cp -f boot_cdt_array.c ../../../boot_images/QcomPkg/SDMPkg/Library/XBLLoaderLib/

if [[ -f "cdt_array.bin" && -d "$ws_dir/cdt" ]];then
    cp -f cdt_array.bin $ws_dir/cdt
else
    mkdir -p $ws_dir/cdt
    cp -f cdt_array.bin $ws_dir/cdt
fi


cd $ws_dir/boot_images
python -u QcomPkg/buildex.py --variant LA -r RELEASE -t SDM6150Pkg,QcomToolsPkg


echo "build trustzone_images ..."

cd $ws_dir/trustzone_images/build/ms

python build_all.py -b TZ.XF.5.0 CHIPSET=sm6150 --config=build_config_deploy.xml --recompile

echo "build aop ..."
cd $ws_dir/aop_proc/build
./build_6150.sh


echo "build adsp ..."
if [ "$is_build_adsp" == "true" ];then

    source $ws_dir/env.sh
    
    if [ -f "$ws_dir/adsp_proc/ssc/tools/nanopb-0.3.6-linux-x86.tar.gz" ];then
        cd $ws_dir/adsp_proc
        python ssc/build/config_nanopb_dependency.py -f nanopb-0.3.6-linux-x86
    else
        echo "file nanopb-0.3.6-linux-x86.tar.gz doesn't exists. download it plz..."
    fi

    cd  $ws_dir/adsp_proc
    python ./build/build.py -c sm6150 -f aDSP -o all -f aDSP
fi

echo "build cdsp ..."
if [ "$is_build_cdsp" == "true" ];then
    source $ws_dir/env.sh
    cd $ws_dir/cdsp_proc
    python ./build/build.py -c sm6150 -f cDSP -o all
fi




echo "update nonHLOS ..."

cd $ws_dir/common/build
python build.py
