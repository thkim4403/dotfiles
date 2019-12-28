while IFS= read -r line; do
    #expr "$line" : '.*\(/usr/lib/.*\)'
    for token in $line; do
        
done < $1
