reqTotal=$(wc -l $1 | awk -F' ' '{print $1}')
post=0
get=0
push=0
put=0

while IFS= read -r line; do
    method=$(echo $line | cut -d' ' -f6)
    if [ $method == '"POST' ]
        then
        post=$[$post + 1]
        # echo $post
    elif [ $method == '"GET' ]
        then
        get=$[$get + 1]
    fi
done < "$1"

printf "Total Number of Request %s\n" $reqTotal
printf "Total Number of Post Request %s\n" $post
printf "Total Number of GET Request %s\n" $get
