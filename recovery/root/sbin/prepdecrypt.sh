#!/sbin/sh

LOG=/tmp/recovery1.log
TAG=PREPDEC

exit 1

F_LOG(){
   MSG="$1"
   echo -e "I:$TAG: $(date +%F_%T) - $MSG" >> $LOG
}
F_ELOG(){
   MSG="$1"
   echo -e "E:$TAG: $(date +%F_%T) - $MSG" >> $LOG
}
F_LOG "Started $0"

relink()
{
	fname=$(basename "$1")
	target="/sbin/$fname"
	sed 's|/system/bin/linker|///////sbin/linker|' "$1" > "$target"
	chmod 755 $target
}

# the dev path can be different so we need to identify it
syspathsoc="/dev/block/platform/soc/soc:ap-ahb/20600000.sdio/by-name/system"
syspathnosoc="/dev/block/platform/20600000.sdio/by-name/system"
syspath=undefined
while [ ! -e "$syspath" ];do
    [ -e "$syspathnosoc" ] && syspath="$syspathnosoc"
    [ -e "$syspathsoc" ] && syspath="$syspathsoc"
    F_LOG "syspath: $syspath"
    [ "$syspath" == "undefined" ] && F_LOG "sleeping a bit as syspath is not there yet.." && sleep 1
done

F_LOG "$(echo "Prepare and mount:")"
mkdir /s >> $LOG 2>&1 || F_ELOG "mkdir /s failed"
mount -t ext4 -o ro $syspath /s  >> $LOG 2>&1 || F_ELOG "mounting /s to $syspath failed"

F_LOG "$(echo "LS Dirs:"; \
ls -la / 2>&1 ; \ 
ls -la /s/ 2>&1 ; \ 
ls -la /dev/block/ 2>&1 ; \ 
ls -la /dev/block/platform/ 2>&1 ; \ 
ls -la /dev/block/platform/soc/ 2>&1 ; \ 
ls -la /dev/block/platform/ 2>&1)"  

# directories
F_LOG "$(echo "Preparing directories:"; \
mkdir /vendor 2>&1 ; \ 
mkdir -p /system/etc 2>&1 ; \
mkdir -p /vendor/lib/hw/ 2>&1 ; \
mkdir /persist-lg 2>&1 ; \ 
mkdir /firmware 2>&1)"

# this relinks (linker) AND copies qseecomd to /sbin
if [ -f /s/vendor/bin/qseecomd ];then
    relink /s/vendor/bin/qseecomd  >> $LOG 2>&1
    [ $? -ne 0 ] && F_ELOG "relinking qseecomd failed (vendor)"
else
    relink /s/bin/qseecomd >> $LOG 2>&1 || F_ELOG "relinking qseecomd failed"
    [ $? -ne 0 ] && F_ELOG "relinking qseecomd failed (system)"
fi

F_LOG "preparing libraries..."

# copy the hws stuff
cp /s/bin/hwservicemanager /sbin/ >> $LOG 2>&1 
cp /s/lib/libandroid_runtime.so /sbin/ >> $LOG 2>&1 
cp /s/lib/libhidltransport.so /sbin/ >> $LOG 2>&1 
cp /s/lib/libhidlbase.so /sbin/ >> $LOG 2>&1 
cp /s/lib/android.hidl.base@1.0.so /sbin/ >> $LOG 2>&1 
cp /s/lib/libicuuc.so /sbin/ >> $LOG 2>&1
cp /s/lib/libxml2.so /sbin/ >> $LOG 2>&1

# copy the decrypt stuff
cp #/s/vendor/lib/libdiag.so /sbin/ >> $LOG 2>&1 
cp /s/vendor/lib/libdrmfs.so /sbin/ >> $LOG 2>&1 
cp /s/vendor/lib/libdrmtime.so /sbin/ >> $LOG 2>&1 
cp #/s/vendor/lib/libQSEEComAPI.so /sbin/ >> $LOG 2>&1 
cp /s/vendor/lib/librpmb.so /sbin/ >> $LOG 2>&1 
cp /s/vendor/lib/libssd.so /sbin/ >> $LOG 2>&1 
cp /s/vendor/lib/libtime_genoff.so /sbin/ >> $LOG 2>&1 
cp /s/vendor/manifest.xml >> $LOG 2>&1 
cp /s/vendor/compatibility_matrix.xml >> $LOG 2>&1 
cp /s/vendor/lib/hw/android.hardware.keymaster@3.0-impl-qti.so /sbin/android.hardware.keymaster@3.0-impl-qti.so >> $LOG 2>&1 
cp /s/vendor/lib/hw/android.hardware.gatekeeper@1.0-impl-qti.so /sbin/android.hardware.gatekeeper@1.0-impl-qti.so >> $LOG 2>&1 

cp /s/vendor/lib/hw/android.hidl.base@1.0.so /sbin/android.hidl.base@1.0.so >> $LOG 2>&1 
#cp /s/vendor/lib/hw/android.hardware.keymaster@3.0-impl-qti.so /vendor/lib/hw/android.hardware.keymaster@3.0-impl-qti.so >> $LOG 2>&1 
#cp /s/vendor/lib/libmdtp.so /vendor/lib/libmdtp.so >> $LOG 2>&1 
cp /s/vendor/lib/libqmi_common_so.so >> $LOG 2>&1 
cp /s/vendor/lib/libsmemlog.so >> $LOG 2>&1 
cp /s/vendor/lib/libqmiservices.so >> $LOG 2>&1 
cp /s/vendor/lib/libqmi_encdec.so >> $LOG 2>&1 
cp /s/vendor/lib/libqmi_client_qmux.so >> $LOG 2>&1 
cp /s/vendor/lib/libqmi_cci.so >> $LOG 2>&1 
cp /s/vendor/lib/libmdmdetect.so >> $LOG 2>&1 
cp /s/vendor/lib/libidl.so >> $LOG 2>&1 
cp /s/vendor/lib/libdsutils.so >> $LOG 2>&1 
cp /s/vendor/lib/libdiag.so >> $LOG 2>&1 
cp /s/vendor/lib/libQSEEComAPI.so >> $LOG 2>&1 
cp /s/vendor/lib/libGPreqcancel.so >> $LOG 2>&1
cp /s/vendor/lib/libGPreqcancel_svc.so >> $LOG 2>&1
cp /s/vendor/lib/libqdutils.so >> $LOG 2>&1
cp /s/vendor/lib/libqisl.so >> $LOG 2>&1
cp /s/vendor/lib/libqservice.so >> $LOG 2>&1
cp /s/vendor/lib/librecovery_updater_msm.so >> $LOG 2>&1
cp /s/vendor/lib/libsecureui.so >> $LOG 2>&1
cp /s/vendor/lib/libSecureUILib.so >> $LOG 2>&1
cp /s/vendor/lib/libsecureui_svcsock.so >> $LOG 2>&1
cp /s/vendor/lib/libspcom.so >> $LOG 2>&1
cp /s/vendor/lib/libspl.so >> $LOG 2>&1
cp /s/vendor/lib/libStDrvInt.so >> $LOG 2>&1
cp /s/vendor/lib/libkeymasterdeviceutils.so >> $LOG 2>&1
cp /s/vendor/lib/libkeymasterprovision.so >> $LOG 2>&1
cp /s/vendor/lib/libkeymasterutils.so >> $LOG 2>&1
cp /s/vendor/lib/vendor.qti.hardware.tui_comm@1.0_vendor.so >> $LOG 2>&1


F_LOG "preparing libraries finished"

umount /s >> $LOG 2>&1 || F_ELOG "unmounting /s failed"

# inform init to start qseecomd
setprop crypto.ready 1  >> $LOG 2>&1 
F_LOG "crypto.ready: $(getprop crypto.ready)"

F_LOG "current mounts: \n$(mount)"

F_LOG "$0 ended"
exit 0
