#!/bin/bash

declare -a dirs=("images" "documents" "pdfs" "executables" "data" "unknown")

declare -A file_count
declare -A byte_count

for dir in "${dirs[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "Creating directory: $dir"
    mkdir "$dir"

    file_count[$dir]=0
    byte_count[$dir]=0
  else
    echo "Directory $dir already exists."
  fi
done

move_files() {
  local file=$1
  local ext="${file##*.}"
  local dest

  case $ext in
    jpg|jpeg|png|gif)
      dest="images"
      ;;
    txt|docx|doc|pages|key|pptx|ppt|odt|md)
      dest="documents"
      ;;
    pdf)
      dest="pdfs"
      ;;
    csv|xlsx|json)
      dest="data"
      ;;
    sh|exe)
      dest="executables"
      ;;
    *)
      dest="unknown"
      ;;
  esac

  if [ "$dest" ]; then
    if [[ ! -e "$dest/$file" ]]; then
      mv "$file" "$dest/"
      local size=$(stat -c%s "$dest/$file")
      ((file_count[$dest]++))
      ((byte_count[$dest]+=$size))
      echo "Moved $file to $dest/"
    else
      echo "File $file already exists in $dest. Skipping."
    fi
  fi
}

echo "Moving files into respective directories..."
for file in *; do
  if [ -d "$file" ]; then continue; fi
  move_files "$file"
done

echo
echo "Total number of files moved: ${#file_count[@]}"
echo "Total size of files moved: $(IFS=+; echo "$((${byte_count[*]}))") B"
echo "Average file size: $(IFS=+; echo "$(( ${byte_count[*]} / ${#file_count[@]} ))") B"
echo
echo "Breakdown per file type"
for dir in "${dirs[@]}"; do
  if [ ${file_count[$dir]} -gt 0 ]; then
    echo "Total files moved to $dir: ${file_count[$dir]}"
    echo "Total bytes moved to $dir: ${byte_count[$dir]} B"
    echo "Average file size in $dir: $(( ${byte_count[$dir]} / ${file_count[$dir]} )) B"
  else
    echo "No files moved to $dir."
  fi
done
