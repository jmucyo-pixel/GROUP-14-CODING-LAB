import time
import random
from datetime import datetime
import os
# Ensure the active_logs directory exists
os.makedirs("active_logs", exist_ok=True)

log_file = "active_logs/heart_rate.log"
