from datetime import datetime, date, time, timezone
import uuid


randomnum = uuid.uuid4().hex[:30]
date = datetime.now().date()

print(date)