#  xcode-settings.sh
#
#
#  Created by Yazan Qaisi on 23/05/2024.
#

#!/bin/sh

set -e

defaults write com.apple.dt.Xcode AutomaticallyCheckSpellingWhiteTyping -bool YES

defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool YES
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlys -bool YES

defaults write com.apple.dt.Xcode DVTTextIndentTabWidth -int 4
defaults write com.apple.dt.Xcode DVTTextIndentWidth -int 4
