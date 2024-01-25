#!/bin/bash

# Output and error files
output_file="./2-3/output.log"
error_file="./2-3/error.log"

# Counter for number of runs
run_counter=0

# Run the script until it fails
while true; do
    # Increment the run counter
    ((run_counter++))

    # Run the script and capture output and error
    ./2-3question.sh > "$output_file" 2> "$error_file"

    # Check the exit status of the script
    if [ $? -ne 0 ]; then
        echo "Script failed after $run_counter runs."
        break
    fi
done

# Print the captured output and error
echo "Captured Output:"
cat "$output_file"
echo "Captured Error:"
cat "$error_file"

# Cleanup: Remove temporary files
# rm "$output_file" "$error_file"