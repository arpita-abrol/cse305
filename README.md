# cse305

Team Name: BAP

Team Members: Arpita Abrol, Paris Fisher, Brianna Florio

# Project Submission

The project submission files can be found in the ```SUBMISSION``` folder

# Project Requirements

Java 11

Apache Tomcat Server 9

MySQL Server 5.7.20 (MySQL Workbench can be a more recent version, but you may have some issues)

# Running Instructions

Clone this project locally. Import from Existing Sources, and select this repository. 

Ensure that Apache Tomcat 9 is added as a server in Eclipse.

Add two environment variables, ``NETID`` and ``SBUID``. Your database schema should be the same as your NETID, and the default login settings for your MySQL Workbench account should not have changed. Add environment variables by right-clicking your project and selecting "Run As" -> "Run Configurations...", selecting Apache Tomcat 9, and adding the variables under the "Environment" tab.

Now, you should be able to run this web app by selecting "Run As" and running it on Apache Tomcat 9.

# Changes to source code

A hidden field was added to ```editMovie.jsp``` to pass ```movieID```

For SalesReport, the form values for months were modified to add a leading 0

# GUI Changes

We made changes to the provioded GUI by adding in new css files. We also made minor edits for details such as spelling errors or missing ```<title>``` tags, though not all errors were caught
