import time
import random
from datetime import datetime
import os

# Ensure the active_logs directory exists
os.makedirs("active_logs", exist_ok=True)

log_file = "active_logs/heart_rate.log"

print("Heart rate monitoring started... (CTRL+C to stop)")

try:
    while True:
        # -----------------------------
        # COMMENT 2: Generate timestamp and simulate a heart rate device reading
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        device_id = f"HR_Device_{random.randint(1,3)}"  # Random device ID
        heart_rate = random.randint(60, 100)           # Random heart rate value

        # -----------------------------
        # COMMENT 3: Append the simulated reading to the log file
        with open(log_file, "a") as f:
            f.write(f"{timestamp} {device_id} {heart_rate}\n")

        # -----------------------------
        # COMMENT 4: Wait 2 seconds before the next reading
        time.sleep(2)

# -----------------------------
# COMMENT 5: Handle user stopping the script gracefully
except KeyboardInterrupt:
    print("\nHeart rate monitoring stopped.")
