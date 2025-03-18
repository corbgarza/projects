#!/bin/bash
source exercises.txt

EXERCISENUMBER=1
while [ $EXERCISENUMBER -gt 0 ]; 
do
echo $IMPLEMENT_OPTIONS
read -p "Select Implement: " IMPLEMENT
echo $MOVEMENT_OPTIONS
read -p "Select Implement: " MOVEMENT
echo $MOVEMENT_GRIP_WIDTH_OPTIONS
read -p "Select Implement: " MOVEMENT_GRIP_WIDTH
echo $MOVEMENT_BENCH_TYPE_OPTIONS
read -p "Select Implement: " MOVEMENT_BENCH_TYPE
echo $MOVEMENT_BENCH_MOD_OPTIONS
read -p "Select Implement: " IMPLEMENT
echo $MOVEMENT_SQUAT_TYPE_OPTIONS
read -p "Select Implement: " IMPLEMENT
echo $MOVEMENT_SQUAD_MOD_OPTIONS
read -p "Select Implement: " IMPLEMENT
echo $MOVEMENT_DEADLIFT_MOD_OPTIONS
read -p "Select Implement: " IMPLEMENT

read -p "Select Exercise Number: " EXERCISENUMBER
echo $EXERCISENUMBER > /dev/null
done
