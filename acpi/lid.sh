#!/bin/sh
if grep -q open /proc/acpi/button/lid/*/state
  then vbetool dpms on;
  else vbetool dpms off;
fi
