#!/bin/bash

while :
do
clear
echo "WELCOME TO THE STUDENT MANAGEMENT SYSTEM."
echo "1. ADD A STUDENT'S INFORMATION TO THE SYSTEM."
echo "2. SEARCH A STUDENT'S INFORMATION"
echo "3. DELETE A STUDENT'S INFORMATION."
echo "4. VIEW ALL THE STORED STUDENTS AND RESPECTIVE INFORMATION "
echo "5. UPDATE A STUDENT'S INFORMATION"
echo "6. QUIT"
read -p "ENTER YOU CHOICE:-" usr_cmd
clear

case $usr_cmd in
1)echo "ADD NEW STUDENT INFORMATION"
 read -p "ENTER STUDENT NAME:-" name
 read -p "ENTER STUDENT ROLL NO. :-" rno
 read -p "ENTER STUDENT DEPARTMENT. :-" dept
 read -p "ENTER STUDENT D.O.B. :-" dob
 read -p "ENTER AVERAGE CGPA :-" cgpa
 read -p "ENTER THE ADDRESS OF THE STUDENT :-" adde
 clear
 echo "NEW STUDENT INFO"
 echo " -> NAME: $name. -> ROLLNO.: $rno. -> DEPARTMENT : $dept -> DOB: $dob -> CGPA: $cgpa -> ADDRESS : $adde "
 echo " $name: $rno : $dept :  $dob : $cgpa : $adde" >> proto1.log
 echo "INFORMATION SAVED SUCCESSFULLY"
;;
2)echo "SEARCH STUDENT INFORMATION"
  read -p "ENTER THE ROLL NO. OF THE STUDENT TO BE SEARCHED:-" search_query
  clear
  echo "SEARCH RESULTS ARE"
  grep -i $search_query proto1.log
;;
3)echo "DELETE THE STUDENT INFO"
  read -p "ENTER THE ROlL NO. OF THE STUDENT WHOSE INFO IS TO BE DELETED(case sensitive):-" delete_string
  sed -i -e "/$delete_string/d" proto1.log
  echo "STUDENT INFORMATION HAS BEEN SUCCESSFULLY DELETED"
;;
4)echo "STUDENT INFORMATION STORAGE SYSTEM"
  echo ""
  cat proto1.log
;;
5)echo "UPDATE "
  echo "NOTE: IF A PARTICULAR FIELD IS NOT TO BE UPDATED HIT THE ENTER KEY TO SKIP"
  read -p "ENTER THE ROlL NO. OF THE STUDENT WHOSE INFORMATION IS TO BE UPDATED: " sr_query
  grep -i $sr_query proto1.log
  read -p "ENTER THE WRONG NAME IF NAME IS TO BE UPDATED:- " up_string
  read -p " ENTER THE NEW NAME OF THE STUDENT:- " name1
   sed -i "s/$up_string/$name1/" proto1.log
  read -p "ENTER THE OLD DEPARTMENT IF CHANGED:- " dept_string
  read -p " ENTER THE NEW DEPARTMENT OF THE STUDENT:- " dept1
   sed -i "s/$dept_string/$dept1/" proto1.log
   read -p "ENTER THE WRONG DOB IF TO BE UPDATED:- " dd_string
  read -p " ENTER THE NEW NAME OF THE STUDENT:- " dob1
   sed -i "s/$dd_string/$dob1/" proto1.log
  read -p "ENTER THE WRONG AVG CGPA IF TO BE UPDATED:- " cg_string
  read -p " ENTER THE NEW CGPA OF THE STUDENT:- " cg1
   sed -i "s/$cg_string/$cg1/" proto1.log
  read -p "ENTER THE WRONG ADDRESS IF TO BE UPDATED:- " adde_string
  read -p " ENTER THE NEW ADDRESS OF THE STUDENT:- " adde1
   sed -i "s/$adde_string/$adde1/" proto1.log
;;
6)break;;
*)echo "INVALID OPTION";;
esac;

read -p "Press 5 to Quit OR Hit Enter to Return to Main Menu:   " confirm_exit
if [$confirm_exit -eq 6]
then break
fi
done

