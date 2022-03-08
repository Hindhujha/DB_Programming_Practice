@echo off
@echo EXecuting my TSQL Table Creation Scripts
SQLCMD -S DESKTOP-FC404HQ\SQLEXPRESS -d Demo -E -i "F:\Database\DB_Programming\DB_Programming_Practice\BatchProcessing\BatchProcess.sql"
PAUSE 

