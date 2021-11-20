#!/bin/bash

grep '05:00:00 AM\|08:00:00 AM\|02:00:00 PM' 0310_Dealer_schedule |awk -F" " '{print $1 $2 $5 $6}'
