#!/bin/bash

START=$(date +%s)
flutter test --coverage --test-randomize-ordering-seed random
genhtml coverage/lcov.info -o coverage/
open coverage/index.html
END=$(date +%s)
DIFF=$(echo "$END - $START" | bc)
echo "It took $DIFF seconds"