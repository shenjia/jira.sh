function ci() {
    if [ -z $1 ] 
    then
        echo "Usage: ci {jira-issue-id} [files]"
        echo "E.g.: ci XX-3331"
        echo "      ci XX-3331 a.php"
        echo "      ci XX-3331 a.php b.php"
    else
        if [ -z $2 ]
        then
            ISSUE=$1
            FILES=""
        else
            ISSUE=$1
            shift
            FILES=$@
        fi  
        TITLE=`title $ISSUE`
        if [ -n "$TITLE" ]
        then
            COMMIT="svn commit $FILES -m \"$ISSUE $TITLE\""
            echo -e "$COMMIT ? (y/n):\c"
            read CHOICE
            if [[ $CHOICE == "y" ]]
            then
                echo "$FILES -m \"$ISSUE $TITLE\"" | xargs svn commit
            fi  
        fi  
    fi  
}