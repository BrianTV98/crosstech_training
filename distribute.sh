SEPARATED_F="\033[1;32m"
INFO_F="\033[1;37m"
RESET_F="\033[0;32m"

DEVPATH=$(echo $PWD && cd ..)

echo "${INFO_F}"
echo "Kampvie app - Build info configuration process..."

echo "${SEPARATED_F}"
echo "========================================================"
read -p "Environment ( 1: dev | 2: prod | 0: both ): " environment
read -p "Platform ( 1: android | 2: ios | 0: both ): " platform
read -p "Changes: " change_log
echo "========================================================"

echo "${INFO_F}"
echo "Firebase App Distribution - Starting build and upload process for $environment environment..."

echo "${RESET_F}"

if [[ $platform = "both" || $platform = "android" || $platform = "0" || $platform = "1" ]]
then
    echo "[Android] --- Running fastlane distribution for $environment environment..."
    cd "android" || exit

    if [[ $environment = "both" || $environment = "dev" || $environment = "0" || $environment = "1" ]]
    then
        fastlane firebase_distribution dev_path:$DEVPATH --env development change_log:"$change_log"
    fi

    if [[ $environment = "both" || $environment = "prod" || $environment = "0" || $environment = "2" ]]
    then
        fastlane firebase_distribution dev_path:$DEVPATH --env prod change_log:"$change_log"
    fi
fi

if [[ $platform = "both" || $platform = "0" ]]
then
    cd ..
fi

if [[ $platform = "both" || $platform = "ios" || $platform = "0" || $platform = "2" ]]
then
    echo "[iOS] --- Running fastlane distribution for $environment environment..."
    # shellcheck disable=SC2164
    cd ios

    if [[ $environment = "both" || $environment = "dev" || $environment = "0" || $environment = "1" ]]
    then
        fastlane firebase_distribution dev_path:$DEVPATH --env development change_log:"$change_log"
    fi

    if [[ $environment = "both" || $environment = "prod" || $environment = "0" || $environment = "2" ]]
    then
        fastlane firebase_distribution dev_path:$DEVPATH --env prod change_log:"$change_log"
    fi
fi