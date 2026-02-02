#!/bin/bash

# Interactive log analysis script
while true; do
    echo "Select log file to analyze:"
    echo "1) Heart Rate (heart_rate_log.log)"
    echo "2) Temperature (temperature_log.log)"
    echo "3) Water Usage (water_usage_log.log)"
    echo -n "Enter choice (1-3): "
    read choice

    case $choice in
        1)
            log_file="active_logs/heart_rate_log.log"
            log_type="Heart Rate"
            break
            ;;
        2)
            log_file="active_logs/temperature_log.log"
            log_type="Temperature"
            break
            ;;
        3)
            log_file="active_logs/water_usage_log.log"
            log_type="Water Usage"
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

# Check if log file is empty
if [ ! -s "$log_file" ]; then
    echo "Error: Log file $log_file is empty."
    exit 1
fi

# Ensure reports directory exists
mkdir -p hospital_data/reports

report_file="hospital_data/reports/analysis_report.txt"
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

echo "Analyzing $log_type logs..."

# Append analysis header to report
echo "========================================" >> "$report_file"
echo "Analysis Report - $log_type" >> "$report_file"
echo "Generated: $timestamp" >> "$report_file"
echo "========================================" >> "$report_file"

# Count occurrences of each device and get first/last timestamps
awk '{
    device = $3
    timestamp = $1 " " $2
    count[device]++
    if (first[device] == "" || timestamp < first[device]) {
        first[device] = timestamp
    }
    if (last[device] == "" || timestamp > last[device]) {
        last[device] = timestamp
    }
}
END {
    for (device in count) {
        print "Device: " device
        print "Total Count: " count[device]
        print "First Entry: " first[device]
        print "Last Entry: " last[device]
        print "---"
    }
}' "$log_file" >> "$report_file"

echo "" >> "$report_file"

echo "Analysis complete. Results appended to $report_file"


