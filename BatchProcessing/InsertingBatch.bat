@echo off
@echo Executing Mutiple sql scripts from folder in one go
for %%G in (*.sql) do sqlcmd -S DESKTOP-FC404HQ\SQLEXPRESS -d Demo -E -i ""%%G
PAUSE