#!/bin/bash

echo `ping -W 1 -c 1 $HADES | head -n 1 | awk '{print $3}'\
    | tr -d "()"`
