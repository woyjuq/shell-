#!/bin/bash
alias chrome="open -a 'Google Chrome"
while read line
do
open -a 'Google Chrome' "$line"
done < ~/url.txt