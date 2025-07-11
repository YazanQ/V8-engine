# configure.sh
# Kit
#
# Created By Yazan Qaisi on 03/06/2024.
#

GOOGLESERVICE_INFO_PLIST=GoogleService-Info.plist
GOOGLESERVICE_INFO_PLIST_PATH=Configurations/Firebase/${CONFIGURATION}/${GOOGLESERVICE_INFO_PLIST}

echo "Looking for ${GOOGLESERVICE_INFO_PLIST} in ${GOOGLESERVICE_INFO_PLIST_PATH}"

if [ ! -f $GOOGLESERVICE_INFO_PLIST_PATH ]
then
    echo "No ${CONFIGURATION} GoogleService-Info.plist found. Please ensure it's in the proper directory."
    exit 1
fi

exho "Will copy ${CONFIGURATION} ${GOOGLESERVICE_INFO_PLIST} to final destination: ${PLIST_DESTINATION}"

cp "${GOOGLESERVICE_INFO_PLIST_PATH}" "${PLIST_DESTINATION}"
