#!/bin/bash
 mkdir -p databases
  echo  ------------------------------------------------
  echo  ------------------ Main Menu --------------------
  echo  ------------------------------------------------
while true
do 
PS3="Your Choice IS : "
  select choice in "Create Database" "List Databases" "Connect to Database" "Drop Database" "Exit from DBMS"
  do
  case $REPLY in
  1)
  read -p "Enter a name for the database: ";
  if  [[ -d databases/$REPLY ]]; then
  echo "Database already exists"
  else
    mkdir databases/${REPLY}
	   echo ${REPLY} database created successfully.
	   fi 
	   break
  ;;
  2)
  echo "The available databases are :"
  ls -1 databases
  break
  ;;
  3)
  read -p "Enter the name of the database you want to connect with:"
  connectedDB=$REPLY
  if [[ -d databases/$connectedDB ]]; then
      echo You are now connected to $connectedDB database

  else
     echo No database with name $connectedDB

  fi
  break
  ;;
  4)
  read -p "Enter the name of the database you want to drop: "
  if [[ -d databases/$REPLY ]];then
       rm -r databases/$REPLY
	     echo $REPLY dropped successfully
  else 
       echo their is no database with this name
  fi
  break
  ;;
  5)
      exit
	  ;;
  *)
     echo $REPLY is invalid choice
	    break
		;;
	esac
done
done

