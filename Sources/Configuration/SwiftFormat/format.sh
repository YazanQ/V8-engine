#
#  format.sh
#
#
#  Created by Yazan Qaisi on 23/05/2024.
#

#!/bin/bash

BASE_DIR=$(dirname "$0")
EXECUTION_DIR="$(pwd)"
EXCLUDED_FILES=**/Generated

if [[ -z $PROJECT_DIR ]]; then
    PROJECT_DIR=$EXECUTION_DIR
fi

if [[ -z $PODS_ROOT ]]; then
    PODS_ROOT=$PROJECT_DIR/Pods
fi

# echo "Executing SwiftFormat"

# git diff --diff-filter=d --staged --name-only | grep -e '\.swift$' | while read FILE; do
#     echo "Found '${FILE}'"
#     ${PODS_ROOT}/SwiftFormat/CommandTool/swiftformat $FILE --config $BASE_DIR/.swiftformat --exclude $EXCLUDED_FILES --quiet "${FILE}";
#     git add "$FILE"
# done

# echo "SwiftFormat done successfully!"

