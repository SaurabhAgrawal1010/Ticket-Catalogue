#!/usr/bin/ksh

sql_file1='query1.sql'
data_file1='daily_d1.txt'
data_cfile1='daily_d1c.txt'
Output_File11='outp_st.txt'
Output_File12='outp_nst.txt'
typeset -Z10 num 
num=0

if [ -f "$data_file1" ];
then
echo "Remove existing daily file"
rm $data_file1
fi

if [ -f "$data_cfile1" ];
then
echo "Remove existing daily c file"
rm $data_cfile1
fi

if [ -f "$Output_File11" ] && [ -f "$Output_File12" ];
then
echo "Remove existing daily Output file"
rm $Output_File11
rm $Output_File12
fi

sqlplus -s DB_NAME/DB_PWD@DB_INSTANCE < $sql_file1 > $data_file1

cc clean.c
./a.out

echo "Content-Type: text/html; charset=us-ascii">$Output_File12
echo "MIME-Version: 1.0" >>$Output_File12

echo "<html>" > $Output_File11
echo "<title> Ticket Catalog " >> $Output_File11
echo "</title>" >> $Output_File11
echo "<body>" >> $Output_File11
echo "<p><b><u>ST serf:</b></u></p>" >> $Output_File11
echo "<table border=1>" >> $Output_File11
echo "<tr bgcolor="SkyBlue">" >> $Output_File11
echo "<th>" >> $Output_File11
echo "Ticket No." >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th>" >> $Output_File11
echo "Priority" >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th>" >> $Output_File11
echo "Create Date" >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th width="100px">" >> $Output_File11
echo "Subject / Category" >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th width="250px">" >> $Output_File11
echo "Short Description" >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th width="50px">" >> $Output_File11
echo "Operator Name" >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th>" >> $Output_File11
echo "Status" >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th>" >> $Output_File11
echo "Identified in Release" >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th>" >> $Output_File11
echo "Required for Release" >> $Output_File11
echo "</th>" >> $Output_File11
echo "<th>" >> $Output_File11
echo "Test Stages/Production" >> $Output_File11
echo "</th>" >> $Output_File11
echo "</tr>" >> $Output_File11
echo "<tr>" >> $Output_File11

echo "<html>" >> $Output_File12
echo "<title> Daily Mail" >> $Output_File12
echo "</title>" >> $Output_File12
echo "<body>" >> $Output_File12
echo "<p>Hi Team,</p>" >> $Output_File12
echo "<p><b><u>P1/P2 Serfs:</b></u></p>" >> $Output_File12
echo "<p><b><u>PRD serf:</b></u></p>" >> $Output_File12
echo "<table border=1>" >> $Output_File12
echo "<tr bgcolor="SkyBlue">" >> $Output_File12
echo "<th>" >> $Output_File12
echo "Ticket No." >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th>" >> $Output_File12
echo "Priority" >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th>" >> $Output_File12
echo "Create Date" >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th width="100px">" >> $Output_File12
echo "Subject / Category" >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th width="250px">" >> $Output_File12
echo "Short Description" >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th width="50px">" >> $Output_File12
echo "Operator Name" >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th>" >> $Output_File12
echo "Status" >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th>" >> $Output_File12
echo "Identified in Release" >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th>" >> $Output_File12
echo "Required for Release" >> $Output_File12
echo "</th>" >> $Output_File12
echo "<th>" >> $Output_File12
echo "Test Stages/Production" >> $Output_File12
echo "</th>" >> $Output_File12
echo "</tr>" >> $Output_File12
echo "<tr>" >> $Output_File12

while read line
do
        if [[ $line == " System test" ]] || [[ $line == "  System test" ]] || [[ $line == "System test" ]] || [[ $line == " Integration test" ]] || [[ $line == "  Integration test" ]] || [[ $line == "Integration test" ]] || [[ $line == " Development testing" ]] || [[ $line == "  Development testing" ]] || [[ $line == "Development testing" ]];
        then
            for num in 0 1 2 3 4 5 6 7 8 9 10;
            do
            read line1
            if [[ $line1 == "@" ]];
            then
            echo "</tr>" >> $Output_File11
            echo "<tr>" >> $Output_File11
            ((num=num+1))
            continue;
            fi
            echo "<td>" >> $Output_File11
            echo $line1 >> $Output_File11
            echo "</td>" >> $Output_File11
            ((num=num+1))
            done
        ((num=0))
        continue;
        else
            for num in 0 1 2 3 4 5 6 7 8 9 10;
            do
            read line1
            if [[ $line1 == "@" ]];
            then
            echo "</tr>" >> $Output_File12
            echo "<tr>" >> $Output_File12
            ((num=num+1))
            continue;
            fi
            echo "<td>" >> $Output_File12
            echo $line1 >> $Output_File12
            echo "</td>" >> $Output_File12
            ((num=num+1))
            done
        ((num=0))
        continue;
        fi

done < $data_cfile1
echo "</tr>" >> $Output_File11
echo "</table>" >> $Output_File11
echo "</body>" >> $Output_File11
echo "</html>" >> $Output_File11

echo "</tr>" >> $Output_File12
echo "</table>" >> $Output_File12
echo "</body>" >> $Output_File12
echo "</html>" >> $Output_File12


tac $Output_File12 | sed '4,5 d' | tac > daily_d1c1.txt
rm $Output_File12
cat daily_d1c1.txt > $Output_File12
rm daily_d1c1.txt

tac $Output_File11 | sed '4,5 d' | tac > daily_d1c1.txt
rm $Output_File11
cat daily_d1c1.txt > $Output_File11
rm daily_d1c1.txt

MAILTO=saurabhagrawal535@gmail.com
MAILFROM=saurabhagrawal535@gmail.com
SUBJECT='Ticket Catalog'

word_count=`wc -l $Output_File12 | cut -f7 -d ' '`

if [[ $word_count == 41 ]];
then
echo "in if"
> $Output_File12
fi

word_count=`wc -l $Output_File11 | cut -f7 -d ' '`

if [[ $word_count == 41 ]];
then
echo "in if"
> $Output_File11
fi

cat - ${Output_File12} - ${Output_File11} <<EOF | /usr/sbin/sendmail -oi -t
From: ${MAILFROM}
To: ${MAILTO}
Subject: $SUBJECT
#Content-Type: text/html; charset=us-ascii
#Content-Transfer-Encoding: 7bit
#MIME-Version: 1.0
EOF
