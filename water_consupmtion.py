import time
import random
from datetime import datetime
import os

# -----------------------------
# COMMENT 1: Ensure the active_logs directory exists
# All water usage logs will be stored here
os.makedirs("active_logs", exist_ok=True)

# Path to the log file
log_file = "active_logs/water_usage.log"

print("Water meter monitoring started... (CTRL+C to stop)")

try:
    while True:
        # -----------------------------
        # COMMENT 2: Generate timestamp and simulate a water meter reading
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        device_id = f"WATER_Device_{random.randint(1,3)}"  # Random water meter ID
        water_used = round(random.uniform(0.5, 5.0), 2)    # Random water usage in liters

        # -----------------------------
        # COMMENT 3: Append the simulated reading to the log file
        with open(log_file, "a") as f:
            f.write(f"{timestamp} {device_id} {water_used}\n")

        # -----------------------------
        # COMMENT 4: Wait 2 seconds before the next reading
        time.sleep(2)

# -----------------------------
# COMMENT 5: Handle user stopping the script safely
except KeyboardInterrupt:
    print("\nWater meter monitoring stopped.")
