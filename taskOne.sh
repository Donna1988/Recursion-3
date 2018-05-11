#!/bin/sh
if [ ! -z $1 ]
then
    # see if first parameter exists as user
 
if [ -z  $(getent passwd $1 ) ]

then
echo "not a valid name or id"
exit 
fi


    NAME="$(getent passwd $1 | cut -d ':' -f 1 | cut -d ',' -f 1)"

    FULLNAME="$(getent passwd $NAME | cut -d ':' -f 5 | cut -d ',' -f 1)"

    LAST="$(last $NAME  | head -1)"


  
    if [ $? -eq 0 ]; then
        echo "Username:   $NAME"
    
    echo "Fullname:   $FULLNAME"

    echo "Last login: $LAST"
#shows name and logins 

    last | nawk -v username="$NAME" 'BEGIN {totallogin =0 }
    { if ($1  == username) totallogin += 1 } 
    END { print "Number of logins: "        totallogin }'

    else
#no user exsists 
        echo "No, the user does not exist"
        exit
        
fi

else
#check users that are logged in 
    echo "All users currently logged in"
    who
    exit
fi



