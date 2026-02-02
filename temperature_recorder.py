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
