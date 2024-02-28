#
#  lint.sh
#
#
#  Created by Yazan Qaisi on 27/02/2024.
#

#!/bin/sh
set -ex

BASE_DIR=$(dirname "$0")
PODS_ROOT=$PROJECT_DIR/Pods

echo "Executing SwiftLint"

"${PODS_ROOT}/SwiftLint/swiftlint" lint --config "$BASE_DIR/.swiftlint.yml" --path $PROJECT_DIR

echo "SwiftLint done successfully!"

