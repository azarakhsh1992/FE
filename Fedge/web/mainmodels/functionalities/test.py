import datetime
from django.utils import timezone


current_time = datetime.datetime.now()

day=current_time.day
print(day)

print(timezone.now().replace(minute=0, second=0, microsecond=0))

start_of_week = current_time - datetime.timedelta(days=current_time.weekday())
print(start_of_week)