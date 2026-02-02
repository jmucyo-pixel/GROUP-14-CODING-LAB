import time
import random
from datetime import datetime
import os

# -----------------------------

# COMMENT 1: Ensure the active_logs directory exists

# This is where all temperature log files will be stored

os.makedirs("active_logs", exist_ok=True)

# Path to the log file

log_file = "active_logs/temperature.log"

try:
    while True:
        # -----------------------------
        # COMMENT 2: Generate timestamp and simulate a temperature sensor reading
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        device_id = f"TEMP_Device_{random.randint(1,3)}"   # Random sensor ID
        temperature = round(random.uniform(18.0, 38.0), 1) # Random temperature value

        # -----------------------------
        # COMMENT 3: Append the simulated reading to the log file
        with open(log_file, "a") as f:
            f.write(f"{timestamp} {device_id} {temperature}\n")

        # -----------------------------
        # COMMENT 4: Wait 2 seconds before generating the next reading
        time.sleep(2)

# -----------------------------
# COMMENT 5: Handle user by stopping the script safely
except KeyboardInterrupt:
    print("\nTemperature sensor stopped.")
