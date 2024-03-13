#
#  pre-commit.sh
#
#
#  Created by Yazan Qaisi on 28/02/2024.
#

#!/usr/bin/env bash

PROJECT_DIR="$(pwd)"

sh $PROJECT_DIR/Pods/V8Engine/Sources/Configuration/SwiftFormat/format.sh
