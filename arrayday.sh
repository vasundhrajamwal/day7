max=10
first=1

while [ "$first" -le "$max" ]
do
array[$first]=$((RANDOM%1000))
let "first += 1"
done
echo "${array[*]}"

if [ "${#array[@]}" -lt 2 ]
then
  echo Incoming array is not large enough >&2
  exit 1
fi

largest=${array[0]}
secondGreatest='unset'

max=${array[0]}
min=${array[10]}

for i in "${array[@]}"; do
  (( i > max )) && max=$i
  (( i < min )) && min=$i
done

echo "Max value is $max" 
echo "Min value is $min"
