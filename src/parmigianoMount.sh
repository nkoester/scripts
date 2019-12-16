
if [[ -z $1 ]]; then
    echo ""
    echo "No goal given. Usage: parmigianoMount.sh [m / r / u]"

    exit 1
fi

## declare an array variable
# You can access them using echo "${arr[0]}", "${arr[1]}" also
declare -a arr=("private"
                "repository"
                "games"
                "shared"
                "borgbackup"
                "download"
                "video"
                )

echo " --> Will mount folders ..."

for i in "${arr[@]}"
do
    if [ "$1" == "m" ]; then
        echo " --> Mount ${i}"
        udevil mount -t nfs parmigiano:/mnt/mainpool/${i} /mnt/parmigiano-${i}
    elif [ "$1" ==  "r" ]; then
        echo " --> Re-mount ${i}"
        udevil mount -o remount parmigiano:/mnt/mainpool/${i}
    elif [ "$1" ==  "u" ]; then
        echo " --> Unmount ${i}"
        udevil umount /mnt/parmigiano-${i}
    else
        echo "Error: Unknown goal '$1'"
        exit 1
    fi
done



# if [ "$1" == "m" ]; then
#     echo " --> Will mount folders ..."
#     udevil mount -t nfs parmigiano:/mnt/mainpool/private /mnt/parmigiano-private
#     udevil mount -t nfs parmigiano:/mnt/mainpool/repository /mnt/parmigiano-repository
#     udevil mount -t nfs parmigiano:/mnt/mainpool/games /mnt/parmigiano-games
#     udevil mount -t nfs parmigiano:/mnt/mainpool/shared /mnt/parmigiano-shared
#     udevil mount -t nfs parmigiano:/mnt/mainpool/borgbackup /mnt/parmigiano-borgbackup
#     udevil mount -t nfs parmigiano:/mnt/mainpool/download /mnt/parmigiano-download
#
# elif [ "$1" ==  "r" ]; then
#     echo " --> Will re-mount folders ..."
#     udevil mount -o remount parmigiano:/mnt/mainpool/private
#     udevil mount -o remount parmigiano:/mnt/mainpool/repository
#     udevil mount -o remount parmigiano:/mnt/mainpool/games
#     udevil mount -o remount parmigiano:/mnt/mainpool/shared
#     udevil mount -o remount parmigiano:/mnt/mainpool/borgbackup
#     udevil mount -o remount parmigiano:/mnt/mainpool/download
#
#     # udevil mount -o remount /mnt/nfs-parmigiano-mnt-mainpool-private
#     # udevil mount -o remount /mnt/nfs-parmigiano-mnt-mainpool-repository
#     # udevil mount -o remount /mnt/nfs-parmigiano-mnt-mainpool-games
#
# elif [ "$1" ==  "u" ]; then
#     echo " --> Will unmount folders ..."
#     udevil umount /mnt/parmigiano-private
#     udevil umount /mnt/parmigiano-repository
#     udevil umount /mnt/parmigiano-games
#     udevil umount /mnt/parmigiano-shared
#     udevil umount /mnt/parmigiano-borgbackup
#     udevil umount /mnt/parmigiano-download
# else
#     echo "Error: Unknown goal '$1'"
#     exit 1
# fi

echo " --> All done."

