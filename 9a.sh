if [ $# -ne 2 ]; then
  echo "Invalid input"
else
  p1=$(ls -l "$1" | cut -d " " -f1)
  p2=$(ls -l "$2" | cut -d " " -f1)

  if [ "$p1" = "$p2" ]; then
    echo "Permissions of both files are the same: $p1"
  else
    echo "Permission of file 1: $p1"
    echo "Permission of file 2: $p2"
  fi
fi



