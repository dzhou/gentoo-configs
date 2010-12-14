#!/bin/sh
#--------
#
#  Sets the ondemand governor and maximum allowable
#  CPU frequency based on the state of the AC adapter
#  for one or more CPUs or cores.
#  
#  Disables all but cpu0 when running on batteries.
#  Update - disabling other cores doesn't appear to help, 
#           so commenting out for #  now. 

syspath=/sys/devices/system/cpu

# cpu_states=$syspath/cpu[123456789]*/online
# if grep -q on /proc/acpi/ac_adapter/*/state
#   then desired_state=1
#   else desired_state=0
# fi

# for cpu_state in $cpu_states ; do
#    if test $(cat $cpu_state) != $desired_state; then
#      echo $desired_state > $cpu_state
#    fi
# done


# Now that the cores are either online or offline, 
# proceed to see their frequencies.
# 
governors=$syspath/cpu*/cpufreq/scaling_governor
scalings=$syspath/cpu*/cpufreq/scaling_max_freq
cpu0=$syspath/cpu0/cpufreq

for governor in $governors
  do echo ondemand > $governor
done

if grep -q on /proc/acpi/ac_adapter/*/state
  then 
    ls $scalings | xargs -n1 cp $cpu0/cpuinfo_max_freq
  else  
    ls $scalings | xargs -n1 cp $cpu0/cpuinfo_min_freq
fi
