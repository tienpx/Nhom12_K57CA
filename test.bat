@echo off
start /b /wait cmd.exe /c bundle install
start /b /wait cmd.exe /c rspec spec

start coverage/index.html