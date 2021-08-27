#!/bin/sh

if [ "$#" != 1 ];then
    echo "invalid parameter"
    echo "./flat_build.sh ~/share_data/qcs610_img/qcs610_rasp"
    exit 0
fi

dest_src=$1

echo "$1 ..."

if [ -d "$dest_src" ]; then
    echo "$dest_src is exists "
    # remove old one
    rm -rf $dest_src/*
else
    echo "$dest_src not exists. creating new dir ..."
    mkdir -p $dest_src
fi

mkdir -p $dest_src/fastboot
mkdir -p $dest_src/debug
mkdir -p $dest_src/erase


echo "creating flat_build ..."

echo "collect apps_proc"
cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/espl-multimedia-image/boot.img $dest_src

cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/espl-multimedia-image/abl.elf $dest_src

cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/espl-multimedia-image/system.img $dest_src/fastboot

cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/espl-multimedia-image/persist.img $dest_src/fastboot

cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/espl-multimedia-image/rawprogram0_WIPE_PARTITIONS.xml $dest_src/erase



#cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/espl-multimedia-image/dtbo.img $dest_src
cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/dtbo.img $dest_src

# use for fastboot
cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/espl-multimedia-image/userdata.img $dest_src/fastboot

# use for debug
cp -rf ./apps_proc/build-qti-distro-fullstack-debug/tmp-glibc/deploy/images/qcs610-odk-64/espl-multimedia-image/vmlinux $dest_src/debug

echo "collecting modem ..."

#cp -rf ./modem_proc/build/ms/bin/sm6150.gennm.prod/qdsp6sw.mbn $dest_src

#cp -rf ./modem_proc/build/ms/bin/sm6150.gennm.prod/qdsp6m.qdb $dest_src

#cp -rf ./modem_proc/build/ms/bin/sm6150.gennm.prod/efs1.bin $dest_src

#cp -rf ./modem_proc/build/ms/bin/sm6150.gennm.prod/efs2.bin $dest_src

#cp -rf ./modem_proc/build/ms/bin/sm6150.gennm.prod/efs3.bin $dest_src

#cp -rf ./modem_proc/mcfg/configs/mcfg_sw/* $dest_src

#cp -rf ./modem_proc/mcfg/configs/mcfg_hw/generic/common/SM6150/* $dest_src

#cp -rf ./modem_proc/mcfg/configs/mcfg_hw/mbn_hw.dig $dest_src

#cp -rf ./modem_proc/mcfg/configs/mcfg_hw/mbn_hw.txt $dest_src

#cp -rf ./modem_proc/core/power/scripts/PowerDebugDump.cmm $dest_src

#cp -rf ./modem_proc/core/bsp/elf_loader_wlan/build/sm6150.gennm.prod/ELF_LOADER_IMG_sm6150.gennm.prodQ.elf $dest_src

#cp -rf ./modem_proc/core/bsp/core_user_pic/build/sm6150.gennm.prod/CORE_USER.so $dest_src

echo "collecting  aop ..."

cp -rf ./aop_proc/build/ms/bin/AAAAANAZO/6150/aop.mbn $dest_src

#cp -rf ./aop_proc/core/bsp/aop/build/6150/AOP_AAAAANAZO.elf $dest_src

#cp -rf ./aop_proc/core/bsp/aop/scripts/* $dest_src

#cp -rf ./aop_proc/core/api/debugtrace/tracer_event_tbl.h $dest_src

#cp -rf ./aop_proc/core/power/arc/scripts/arc_dump.cmm $dest_src

echo "collecting boot_images ..."

cp -rf ./boot_images/QcomPkg/SDMPkg/6150/Bin/LA/RELEASE/xbl.elf $dest_src

cp -rf ./boot_images/QcomPkg/SDMPkg/6150/Bin/LA/RELEASE/xbl_config.elf $dest_src

#cp -rf ./boot_images/QcomPkg/Tools/binaries/logfs_ufs_8mb.bin $dest_src

cp -rf ./boot_images/QcomPkg/SDMPkg/6150/Bin/LA/RELEASE/prog_firehose_ddr.elf $dest_src

#cp -rf ./boot_images/QcomPkg/SDMPkg/6150/Bin/LA/RELEASE/prog_firehose_lite.elf $dest_src

#cp -rf ./boot_images/QcomPkg/Tools/storage/fh_loader/*.* $dest_src

#cp -rf ./boot_images/QcomPkg/SDMPkg/6150/Tools/storage/eMMC/JtagProgrammer.cmm $dest_src

#cp -rf ./boot_images/Build/SDM6150_Loader/DEBUG_CLANG40LINUX/AARCH64/QcomPkg/XBLLoader/XBLLoader/RELEASE/XBLLoader.dll $dest_src


echo "collecting TZ ..."

cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/tz.mbn $dest_src

cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/hyp.mbn $dest_src

cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/devcfg.mbn $dest_src

cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/storsec.mbn $dest_src

cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/km4.mbn $dest_src

cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/cmnlib64.mbn $dest_src

cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/uefi_sec.mbn $dest_src

cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/cmnlib.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/rtic.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/rtic_tst.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/smplap32.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/smplap64.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/widevine.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/isdbtmm.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/securemm.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/gptest.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/qmpsecap.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/soter64.mbn $dest_src

#cp -rf ./trustzone_images/build/ms/bin/PAZAANAA/haventkn.mbn $dest_src

echo "collecting wlan ..."

#cp -rf ./wlan_proc/build/ms/bin/QCAHNALATDL/signed/wlanmdsp.mbn $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.bin $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.102 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.104 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.105 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.106 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.107 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.108 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.109 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b0a $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b0b $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b0d $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b0e $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.10f $dest_src 

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b07 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b09 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b14 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b15 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b30 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b31 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b32 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b33 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b34 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b35 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.202 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b36 $dest_src

#cp -rf ./wlan_proc/wlan/halphy_tools/host/bdfUtil/qca61x0/bdf/bdwlan.b38 $dest_src

#cp -rf ./wlan_proc/build/ms/servreg/QCAHNALATDLQ/modemuw.jsn $dest_src

#cp -rf ./wlan_proc/build/ms/6150/Data.msc $dest_src

#cp -rf ./wlan_proc/build/ms/bin/QCAHNALATDL/signed/wlanmdsp.mbn $dest_src
 
#cp -rf ./wlan_proc/build/ms/M6150_WLAN_MERGED.elf $dest_src

echo "collecting btfm ..."

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/crbtfw11.tlv $dest_src

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/crnv11.bin $dest_src

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/crbtfw20.tlv $dest_src

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/crnv20.bin $dest_src

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/crbtfw21.tlv $dest_src

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/crnv21.bin $dest_src

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/apbtfw10.tlv $dest_src

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/apnv10.bin $dest_src

#cp -rf ./btfm_proc/bt/build/ms/bin/WCN3990/apbtfw11.tlv $dest_src

#cp -rf btfm_proc/bt/build/ms/bin/WCN3990/apnv11.bin $dest_src

echo "colleting adsp ..."

#cp -rf ./adsp_proc/build/ms/servreg/6150.adsp.prodQ/adsp.mbn $dest_src

#cp -rf ./adsp_proc/build/ms/servreg/6150.adsp.prodQ/adspr.jsn $dest_src

#cp -rf ./adsp_proc/build/ms/servreg/6150.adsp.prodQ/adsps.jsn $dest_src

#cp -rf ./adsp_proc/build/ms/servreg/6150.adsp.prodQ/adspua.jsn $dest_src

#cp -rf ./adsp_proc/build/dynamic_modules/6150.adsp.prod/* $dest_src

echo "collecting cdsp ..."

#cp -rf ./cdsp_proc/build/ms/servreg/6150.cdsp.prodQ/cdspr.jsn $dest_src

#cp -rf ./cdsp_proc/obj/qdsp6v5_ReleaseG/6150.cdsp.prod/cdsp.mbn $dest_src

#cp -rf ./cdsp_proc/build/dynamic_modules/6150.cdsp.prod/* $dest_src


echo "collecting wdsp ..."

#cp -rf ./wdsp_proc/build/ms/bin/PIL_IMAGES/* $dest_src

echo "collecting venus ..."

#cp -rf ./venus_proc/build/bsp/asic/build/PROD/mbn/reloc/socCheckV6/signed/venus.mbn $dest_src


echo "collecting common ..."

cp -rf ./common/build/emmc/bin/asic/NON-HLOS.bin $dest_src

cp -rf ./common/build/emmc/bin/asic/BTFM.bin $dest_src

cp -rf ./common/build/emmc/bin/asic/dspso.bin $dest_src

cp -rf ./common/core_qupv3fw/sm6150/qupv3fw.elf $dest_src

#cp -rf ./common/build/emmc/bin/asic/multi_image.mbn $dest_src

#cp -rf ./common/build/emmc/bin/asic/multi_image_qti.mbn $dest_src

cp -rf ./common/build/emmc/bin/asic/sparse_images/*.img $dest_src

if [ -f "$dest_src/system_13.img" ]; then
    rm -f $dest_src/system_13.img
fi

# todo
#cp -rf ./common/build/emmc/*.bin $dest_src
#cp -rf ./common/build/emmc/*.xml

#cp -rf ./common/sectools/resources/build/fileversion2/sec.dat $dest_src

cp -rf ./common/build/emmc/gpt_main0.bin $dest_src

cp -rf ./common/build/emmc/gpt_backup0.bin $dest_src

#cp -rf ./common/build/emmc/gpt_both0.bin $dest_src

cp -rf ./common/build/emmc/bin/asic/sparse_images/rawprogram_unsparse0.xml $dest_src

cp -rf ./common/build/emmc/patch0.xml $dest_src
cp -rf ./common/build/emmc/patch0.xml $dest_src/erase

#cp -rf ./common/build/emmc/bin/asic/pil_split_bins/* $dest_src


