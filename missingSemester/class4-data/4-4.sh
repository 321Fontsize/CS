#!/bin/bash

# Display boot time information for the last ten boots
journalctl --list-boots | tail -n 10

# Calculate boot time for each boot and store in an array
boot_times=($(journalctl --list-boots | tail -n 10 | awk '{print $4}'))

# Calculate average boot time
total_boot_time=0
for time in "${boot_times[@]}"; do
  total_boot_time=$((total_boot_time + time))
done
average_boot_time=$((total_boot_time / ${#boot_times[@]}))

# Calculate median boot time
sorted_boot_times=($(printf "%s\n" "${boot_times[@]}" | sort -n))
middle_index=$(((${#sorted_boot_times[@]} - 1) / 2))
median_boot_time=${sorted_boot_times[$middle_index]}

# Calculate max boot time
max_boot_time=${sorted_boot_times[-1]}

# Display results
echo "Average Boot Time: $average_boot_time seconds"
echo "Median Boot Time: $median_boot_time seconds"
echo "Max Boot Time: $max_boot_time seconds"
