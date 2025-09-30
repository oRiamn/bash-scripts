#!/bin/bash

alias ls='ls -lhGpt --color=always'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'


JQC_null="33"
JQC_false="93"
JQC_true="93"
JQC_numbers="96"
JQC_strings="92"
JQC_arrays="97"
JQC_objects="97"
JQC_object_keys="31"

export JQ_COLORS="$JQC_null:$JQC_false:$JQC_true:$JQC_numbers:$JQC_strings:$JQC_arrays:$JQC_objects:$JQC_object_keys"
