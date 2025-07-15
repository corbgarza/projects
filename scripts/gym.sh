#!/bin/env bash

txtFile=$HOME/scripts/gym.txt
ARRAY=(EXERCISE SETS REPS WEIGHT CHAINS BANDS)

readExercise () {
	readarray ARRAY <$txtfile
}

writeExercise () {
	for z in ${ARRAY[@]}; do
	read -p "$z = " y
	ARRAY2+=($y)
	done
	echo ${ARRAY2[@]} >> $txtFile
}

readExercise
x=0
while [ $x -ne 1 ]; do
	writeExercise
	read -p $'1. Quit?\n2. Continue? ' x
done
