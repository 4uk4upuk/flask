#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
   echo "Running Development Server"
   exec python "identidock.py"
elif [ "$ENV" = 'UNIT' ]; then
   echo "Running Unit Tests"
   exec python "tests.py"
else
   echo "Running Production Server"
   exec gunicorn --bind unix:/app/socket.sock identidock:app
fi
