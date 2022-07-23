load_RMX1991()
{
    resetprop "ro.product.name" "RMX1991"
    resetprop "ro.build.product" "RMX1991"
    resetprop "ro.product.device" "RMX1991CN"
    resetprop "ro.commonsoft.ota" "RMX1991"
    resetprop "ro.separate.soft" "19771"
    resetprop "ro.build.date.utc" "1640000000"
    echo "Chinese variant detected - using RMX1991 props"
}
 
load_RMX1992ex()
{
    resetprop "ro.product.name" "RMX1992"
    resetprop "ro.build.product" "RMX1992"
    resetprop "ro.product.device" "RMX1992L1"
    resetprop "ro.commonsoft.ota" "RMX1992"
    resetprop "ro.separate.soft" "19671"
    resetprop "ro.build.date.utc" "1640000000"
    echo "Indian variant detected - using RMX1992ex props"
}

load_RMX1992aex()
{
    resetprop "ro.product.name" "RMX1992"
    resetprop "ro.build.product" "RMX1992"
    resetprop "ro.product.device" "RMX1992L1"
    resetprop "ro.commonsoft.ota" "RMX1992"
    resetprop "ro.separate.soft" "19670"
    resetprop "ro.build.date.utc" "1640000000"
    echo "Indian variant detected - using RMX1992aex props"
}

load_RMX1993()
{
    resetprop "ro.product.name" "RMX1993"
    resetprop "ro.build.product" "RMX1993"
    resetprop "ro.product.device" "RMX1993L1"
    resetprop "ro.commonsoft.ota" "RMX1993"
    resetprop "ro.separate.soft" "19672"
    resetprop "ro.build.date.utc" "1640000000"
    echo "European variant detected - using RMX1993 props"
}
 
project=$(cat /proc/oplusVersion/operatorName)
echo $project
 
case $project in
    "8") load_RMX1991 ;;
    "31") load_RMX1992ex ;;
    "13") load_RMX1992aex ;;
    *) load_RMX1993 ;;
esac
 
resetprop "ro.build.date.utc" "1000000000"
 
exit 0
