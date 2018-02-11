#!/bin/bash

set -Eeuo pipefail

EXPECTED="2"
ACTUAL="$(./reproduce +RTS -N -RTS)"

if [ $ACTUAL -eq $EXPECTED ]
then
  echo "TEST PASSED"
else
  echo "TEST FAILED"
  echo ""
  echo "Expected getNumCapabilities: $EXPECTED"
  echo "Actual   getNumCapabilities: $ACTUAL"
  echo ""

  exit 1
fi
