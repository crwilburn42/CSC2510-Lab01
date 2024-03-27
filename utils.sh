#!/bin/bash
find /usr/bin -type f -name "c*"
find /usr/bin -type l -name "*sh"
find /usr -type f | head -n 10
grep 'model name' /proc/cpuinfo
grep -vc sudo /etc/group
grep 'sudo' /etc/group
