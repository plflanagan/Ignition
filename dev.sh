# Use this as a convenient place to develop new portions of script.

if [ "$#" == 1 ]; then
  echo "Make pod called $1"
  pod lib create $1
else
  echo "Error: No name provided"
fi

echo "Done creating Pod."