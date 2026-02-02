#!/bin/bash

# Interactive log archival script
while true; do
    echo "Select log to archive:"
    echo "1) Heart Rate"
    echo "2) Temperature"
    echo "3) Water Usage"
    echo -n "Enter choice (1-3): "
    read choice

    case $choice in
        1)
            log_file="active_logs/heart_rate_log.log"
            archive_dir="hospital_data/archived_logs/heart_data_archive"
            log_type="heart_rate"
            echo "Archiving heart_rate_log.log..."
            break
            ;;
        2)
            log_file="active_logs/temperature_log.log"
            archive_dir="hospital_data/archived_logs/temperature_data_archive"
            log_type="temperature"
            echo "Archiving temperature_log.log..."
            break
            ;;
        3)
            log_file="active_logs/water_usage_log.log"
            archive_dir="hospital_data/archived_logs/water_usage_data_archive"
            log_type="water_usage"
            echo "Archiving water_usage_log.log..."
            break
            ;;
        *)
            echo "Error: Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done

# Check if log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file $log_file not found."
    exit 1
fi

# Check if archive directory exists, create if not
if [ ! -d "$archive_dir" ]; then
    mkdir -p "$archive_dir"
fi

# Generate timestamp
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
archived_file="$archive_dir/${log_type}_${timestamp}.log"

# Move the log file to archive with timestamp
if mv "$log_file" "$archived_file"; then
    # Create new empty log file
    touch "$log_file"
    echo "Successfully archived to $archived_file"
else
    echo "Error: Failed to archive log file."
    exit 1
fi
