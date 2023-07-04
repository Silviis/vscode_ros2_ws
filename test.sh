#!/bin/bash
set -e

if [ -f install/setup.zsh ]; then source install/setup.zsh; fi
colcon test --merge-install
colcon test-result --verbose
