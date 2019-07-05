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
        echo $get
    fi
done < "$1"