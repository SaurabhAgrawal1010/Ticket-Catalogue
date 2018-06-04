# Ticket-Catalogue

Ticket-Catalogue is very beneficial for the support team where they have to handle the tickets(issues). By running this script regularly, each member of the team get to know the status of the ticket(whether the ticket is resolved or not) and also the priority of the ticket. It will help the team-leads to directly assign the ticket to the team members so that they can work on it.

Shell Script (.sh file) contain the script to send email which contain the details of tickets(issues) to the desired user(s) in a tabular form. The script first takes the details of the ticket from the  desired DataBase. Then it clean the data by calling the C function and later it will add the data in the tabular form. After the data(containing the details of the ticket) is arranged in the tabular form, it will send the email containing the table to the users.

The query.sql file contains the query. Modify the query according to your need. ';' and ';@;' work as a delimiter.
