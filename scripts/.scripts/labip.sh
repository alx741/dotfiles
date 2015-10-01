#!/bin/bash

lab_domain="necropolis.crabdance.com"

echo `ping -W 1 -c 1 $lab_domain | head -n 1 | awk '{print $3}'\
    | tr -d "()"`
