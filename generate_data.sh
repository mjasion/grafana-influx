#!/bin/bash

curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE mydb"

while true; do
  timestamp=`date +%s`
  echo $timestamp
  random=$[ RANDOM % 110 + 100]
  random2=$[ RANDOM % 90  ]
  echo $random
  curl -i -XPOST 'http://localhost:8086/write?db=mydb&precision=s' --data-binary "cpu_load_short,host=server01 value=$random $timestamp"
  curl -i -XPOST 'http://localhost:8086/write?db=mydb&precision=s' --data-binary "cpu_load_short,host=server02 value=$random2 $timestamp"
  sleep  0.5
done
