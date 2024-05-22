#
#  generate.sh
#
#
#  Created by Yazan Qaisi on 28/02/2024.
#

#!/bin/sh

BASE_DIR=$(dirname "$0")
project_dir="$(pwd)"

echo "Executing SwiftGen"

puts "You are in the new swiftGen Sh file"

"${PODS_ROOT}/SwiftGen/bin/swiftgen" config run --config $BASE_DIR/swiftgen.yml

echo "Generating resources done successfully!"
