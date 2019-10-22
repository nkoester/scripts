
if [[ -z $1 ]]; then
    echo ""
    echo "No goal given. Usage: parmigianoMount.sh [m / r / u]"

    exit 1
fi


if [ "$1" == "m" ]; then
    echo " --> Will mount folders ..."
    udevil mount -t nfs parmigiano:/mnt/mainpool/private /media/parmigiano-private
    udevil mount -t nfs parmigiano:/mnt/mainpool/repository /media/parmigiano-repository
    udevil mount -t nfs parmigiano:/mnt/mainpool/games /media/parmigiano-games
    udevil mount -t nfs parmigiano:/mnt/mainpool/shared /media/parmigiano-shared
    udevil mount -t nfs parmigiano:/mnt/mainpool/borgbackup /media/parmigiano-borgbackup
    udevil mount -t nfs parmigiano:/mnt/mainpool/download /media/parmigiano-download

elif [ "$1" ==  "r" ]; then
    echo " --> Will re-mount folders ..."
    udevil mount -o remount parmigiano:/mnt/mainpool/private
    udevil mount -o remount parmigiano:/mnt/mainpool/repository
    udevil mount -o remount parmigiano:/mnt/mainpool/games
    udevil mount -o remount parmigiano:/mnt/mainpool/shared
    udevil mount -o remount parmigiano:/mnt/mainpool/borgbackup
    udevil mount -o remount parmigiano:/mnt/mainpool/download

    # udevil mount -o remount /media/nfs-parmigiano-mnt-mainpool-private
    # udevil mount -o remount /media/nfs-parmigiano-mnt-mainpool-repository
    # udevil mount -o remount /media/nfs-parmigiano-mnt-mainpool-games

elif [ "$1" ==  "u" ]; then
    echo " --> Will unmount folders ..."
    udevil umount /media/parmigiano-private
    udevil umount /media/parmigiano-repository
    udevil umount /media/parmigiano-games
    udevil umount /media/parmigiano-shared
    udevil umount /media/parmigiano-borgbackup
    udevil umount /media/parmigiano-download
else
    echo "Error: Unknown goal '$1'"
    exit 1
fi

echo " --> All done."

