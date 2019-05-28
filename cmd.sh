#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
   echo "Running Development Server"
   exec python "identidock.py"
else
   echo "Running Production Server"
   exec gunicorn --bind 0.0.0.0:8000 identidock:app
fi
