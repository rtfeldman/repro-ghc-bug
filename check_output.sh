#!/bin/bash

set -Eeuox pipefail

EXPECTED="2"
ACTUAL="$(./reproduce +RTS -N -RTS)"

if [ $ACTUAL -eq $EXPECTED ]
then
  echo "TEST PASSED"
else
  echo "TEST FAILED"
  echo "Expected getNumCapabilities: $EXPECTED"
  echo "Actual   getNumCapabilities: $ACTUAL"

  exit 1
fi
