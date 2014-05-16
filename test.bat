@echo off
start /b /wait cmd.exe /c bundle install
start /b /wait cmd.exe /c bundle exec rspec spec

start coverage/index.html
