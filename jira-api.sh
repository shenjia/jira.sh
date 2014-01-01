function jira_api() {

    if [ -z $1 ] 
    then
        echo "Usage: jira_api {api}"
        echo "E.g.: jira_api issue/XX-3331"
    else
        RESPONSE=`curl -s $JIRA_API/$1 -u$JIRA_USER:$JIRA_PASS`
        AUTHENTICATION=`echo "$RESPONSE" | grep -o -E 'AUTHENTICAT\w+' | head -n 1`
        if [ -z "$AUTHENTICATION" ]
        then
            HAS_ERROR=`echo "$RESPONSE" | grep -o -E errorMessages`
            if [ -n "$HAS_ERROR" ]
            then
                MESSAGE=`echo "$RESPONSE" | awk -F\" '{print $4}'`
                echo "Error: $MESSAGE" >&2
                echo "----------------------" >&2
                echo "$RESPONSE" >&2
            else
                echo "$RESPONSE"
            fi  
        else
            echo "Authentication failed. (reason: $AUTHENTICATION)" >&2
        fi  
    fi 
    
}

function title() {
    if [ -z $1 ] 
    then
        echo "Usage: title {jira-issue-id}"
        echo "E.g.: title XX-3331"
    else
        jira_api issue/$1 | grep -o -E '"name":"summary","type":"java.lang.String","value":"[^"]+"' | awk -F: '{print $4}' | tr -d '"'
    fi  
}
