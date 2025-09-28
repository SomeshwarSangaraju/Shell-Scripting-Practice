#!/bin/bash

Start_time =${date+%s}

sleep 10 &

end_time = ${date+%s}
total_time =$(($Start_time+$end_time))

echo "total time taken for execution: $total_time"
