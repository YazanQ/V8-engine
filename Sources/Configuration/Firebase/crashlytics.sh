# crashlytics.sh
# Kit
#
# Created By Yazan Qaisi on 03/06/2024.
#

#!/bin/sh
set -ex

${BUILD_DIR%/Build/*}/SourcePackages/checkouts/firebase-ios-sdk/Crashlytics/run
