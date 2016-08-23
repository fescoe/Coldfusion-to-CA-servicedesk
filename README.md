# Coldfusion-to-CA-servicedesk
Quick cfscript that allows the user to connect into ca service desk.

This script creates a service request in service desk it is dependent on having webservices turned on in SD. 
Using firebug or chrome's developer tools to view the **pdmqa** attribute on an already created ticket you can add custom names, summary,description ect...  For example if you want add a specific user to the Affected End User you would look for the pdmqa attr and see that it's named customer, then you would use customer in the cfscript.

*The labels on a request can be different depending on how you organization set up SD*

####Note
So a request gets sent to the right area be sure to use the correct pcode for the attribute **category** eg: category = "pcat:404273"; 


