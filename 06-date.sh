#!/bin/bash

Start_time=$(date +%s)

sleep 5

end_time=$(date +%s)
total_time=$(($end_time-$Start_time))

echo "total time taken for execution: $total_time"
