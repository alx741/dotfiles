#!/bin/bash

echo `ping -W 1 -c 1 $NECROPOLIS | head -n 1 | awk '{print $3}'\
    | tr -d "()"`
