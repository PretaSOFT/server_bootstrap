#!/bin/bash

PID=`ps -C mysql-backup.sh -o pid=`
renice -20 $PID