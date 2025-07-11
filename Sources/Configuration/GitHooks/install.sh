#
#  install.sh
#  Alhisba
#
#  Created by Yazan Qaisi on 23/05/2024.
#

#!/usr/bin/env bash

BASE_DIR=$(dirname "$0")
GIT_DIR=$(git rev-parse --git-dir)

HOOK_LIST=(
    pre-commit
)

printf "\nInstalling git hooks in ${GIT_DIR}\n"

for HOOK in "${HOOK_LIST[@]}"; do
    if [ -f $GIT_DIR/hooks/$HOOK ]; then
        echo "Skipped the hook: $HOOK"
    else
        echo "Installing the hook: $HOOK"
        ln -sf $BASE_DIR/$HOOK.sh $GIT_DIR/hooks/$HOOK
    fi
done

echo "GitHooks installation complete!"

