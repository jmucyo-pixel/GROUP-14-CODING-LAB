# GROUP-14-CODING-LAB

Below is the link to the track sheet for the group:
https://docs.google.com/spreadsheets/d/11slmfwdKkCGzYrXhTlwg-v4UFm3RZ-P-XsfFLr4Qr4w/edit?usp=sharing


 Hospital Data Monitoring & Archival System

An automated log management system for collecting real-time patient health metrics and resource usage data with controlled archiving and analytical reporting capabilities.

 Project Structure

```
hospital_data/
├── active_logs/                 # Current log files
│   ├── heart_rate.log           # Format: TIMESTAMP DEVICE VALUE
│   ├── temperature.log
│   └── water_usage.log
├── archived_logs/               # Archived data
│   ├── heart_data_archive/
│   ├── temperature_data_archive/
│   └── water_usage_data_archive/
└── reports/
    └── analysis_report.txt
```

 Components

 Python Simulators
- heart_rate_monitor.py - Simulates 2 heart rate monitors (HR_Monitor_01, HR_Monitor_02)
- temperature_recorder.py - Simulates 2 temperature sensors (TEMP_Sensor_01, TEMP_Sensor_02)  
- water_consumption.py - Simulates water usage meters (Water_Meter_Main, Water_Meter_ICU)

 Shell Scripts
- archive_logs.sh - Interactive script for archiving log files with timestamps
- analyze_logs.sh - Intelligent analysis script for generating device statistics

 Setup and Usage

1. Initialize Data Collection

Start the monitoring devices in separate terminals:

bash
 Terminal 1 - Heart Rate Monitoring
python3 heart_rate_monitor.py start

 Terminal 2 - Temperature Monitoring  
python3 temperature_recorder.py start

 Terminal 3 - Water Usage Monitoring
python3 water_consumption.py start


 2. Verify Data Collection

Monitor real-time data:

 View heart rate logs
tail -f hospital_data/active_logs/heart_rate.log

 View temperature logs
tail -f hospital_data/active_logs/temperature.log

 View water usage logs
tail -f hospital_data/active_logs/water_usage.log


 3. Archive Logs

Run the interactive archival script:
bash
./archive_logs.sh


The script will:
- Present a menu to select log type (Heart Rate, Temperature, Water Usage)
- Move the active log to the appropriate archive folder
- Rename with timestamp format: `logtype_YYYY-MM-DD_HH:MM:SS.log`
- Create a new empty log file for continued monitoring
- Include error handling for invalid input and missing files

 4. Analyze Logs

Run the analysis script:
bash
./analyze_logs.sh


The script will:
- Present a menu to select which log file to analyze
- Count occurrences of each device in the selected log
- Record first and last entry timestamps for each device
- Append results to `hospital_data/reports/analysis_report.txt`

 Features

 Error Handling
- Input validation for user menu selections
- File existence checks before operations
- Directory validation for archive operations
- Empty file detection for analysis

 Data Analysis
- Device occurrence counting using awk
- Temporal pattern analysis (first/last entry tracking)
- Formatted report generation with timestamps
- Cumulative reporting (appends to existing reports)

 Log Management
- Automated timestamping for archived files
- Structured directory organization
- Non-disruptive log rotation (creates new empty files)
- Maintains continuous monitoring capability


 Log Format

All log files follow the format:

TIMESTAMP DEVICE_NAME VALUE
2024-01-24 15:30:45 HR_Monitor_01 72
2024-01-24 15:30:47 TEMP_Sensor_02 36.8
2024-01-24 15:30:49 Water_Meter_Main 12.5


 Requirements

- Python 3.x
- Bash shell
- Standard Linux utilities (awk, grep, sort, date, mv, touch)

 Usage Examples

 Archiving Example
bash
$ ./archive_logs.sh
Select log to archive:
1) Heart Rate
2) Temperature
3) Water Usage
Enter choice (1-3): 1

Archiving heart_rate.log...
Successfully archived to hospital_data/archived_logs/heart_data_archive/heart_rate_2024-01-24_15:22:10.log


 Analysis Example
bash
$ ./analyze_logs.sh
Select log file to analyze:
1) Heart Rate (heart_rate.log)
2) Temperature (temperature.log)
3) Water Usage (water_usage.log)
Enter choice (1-3): 1

Analyzing Heart Rate logs...
Analysis complete. Results appended to hospital_data/reports/analysis_report.txt

 Learning Objectives Achieved

1. Shell Scripting Proficiency
   - Interactive menus with select/case statements
   - File operations (mv, touch, awk, grep)
   - Error handling and input validation

2. Log Management & Automation
   - Structured archival with timestamping
   - Automated log rotation without process disruption
   - Programmatic directory organization

3. Data Analysis with CLI Tools
   - Log parsing with awk for device statistics
   - Formatted report generation
   - Cumulative analysis with file managment


