# TSDB_TABLES = ['timeseries_temperaturesensorvalue']
# TSDB_MODELS = ['temperaturesensorvalue']



# class TsdbRouter:
#     def db_for_read(self, model, **hints):
#         if model.__meta.db_table in TSDB_TABLES:
#             return 'tsdb'
#         else:
#             return 'default'
        
#     def db_for_write(self, model, **hints):
#         if model.__meta.db_table in TSDB_TABLES:
#             return 'tsdb'
#         else:
#             return 'default'
        
#     def allow_migrate (self, db, app_label, model_name= None, **hints):
#         if model_name in TSDB_MODELS:
#             return db == 'tsdb'
#         else:
#             return db == 'default'


# from datetime import datetime
# from django.db import migrations, models
# import django.db.models.deletion


# class Migration(migrations.Migration):

#     initial = True

#     dependencies = []

#     operations = [
#         migrations.CreateModel(
#             name="Parameter",
#             fields=[
#                 (
#                     "id",
#                     models.AutoField(
#                         auto_created=True,
#                         primary_key=True,
#                         serialize=False,
#                         verbose_name="ID",
#                     ),
#                 ),
#                 ("parameter_name", models.CharField(max_length=200)),
#             ],
#         ),
#         migrations.CreateModel(
#             name="TimeSeries",
#             fields=[
#                 ("time", models.DateTimeField(primary_key=True, serialize=False)),
#                 ("value", models.FloatField()),
#                 (
#                     "parameter",
#                     models.ForeignKey(
#                         on_delete=django.db.models.deletion.RESTRICT,
#                         to="<django-app>.parameter",
#                     ),
#                 ),
#             ],
#         ),
#         migrations.RunSQL(
#             "ALTER TABLE <django-app>_timeseries DROP CONSTRAINT <django-app>_timeseries_pkey;"
#         ),
#         migrations.RunSQL(
#             "SELECT create_hypertable('<django-app>_timeseries', 'time', chunk_time_interval => INTERVAL '5 days');"
#         ),
#     ]



        # migrations.RunSQL(
        #     "ALTER TABLE <django-app>_doorsensorvalue DROP CONSTRAINT <django-app>_doorsensorvalue_pkey;"
        # ),
        # migrations.RunSQL(
        #     "SELECT create_hypertable('<django-app>_doorsensorvalue', 'time', chunk_time_interval => INTERVAL '5 days');"
        # ),