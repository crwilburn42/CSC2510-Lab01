
if [ ! -d "system_info" ]; then
  mkdir system_info
fi

cd system_info

{
  echo "System information has been gathered. Here's the summary:"
  echo "Date and Time: $(date '+%m/%d/%Y %H:%M:%S %Z')"
  echo "Current User: $(whoami)"
  echo "Current Working Directory: $(pwd)"
  echo "System Usage:"
  top -bn1 | head -5
  echo "Disk Usage:"
  df -h
} > system_info.txt

cat system_info.txt

