# Quickfixer (plumbing website)
Small base application for general plumbing, electrical repairing service, painting, ticket based solution. 

Technology stack:

1. Spring 5.2.0.RELEASE
2. Spring Security 5.2.0.RELEASE
3. Hibernate 5.2.11.Final
4. JDK 1.8
5. Maven 3.1
6. Tomcat 8
7. MySQL 5+

This is base project for plumbing services, all configuartions are Java/Spring annotation based.

Follow the steps to run project locally:
1. Create database quickfixer in mysql, use follwoing db file from project [quickfixer.sql](https://github.com/UmeshRajani/plumbing/blob/master/QuickFixer/quickfixer.sql)
2. Take clone of this project and import project in eclipse as maven
3. Update db configuartion exist under resources folder [db.properties](https://github.com/UmeshRajani/plumbing/blob/master/QuickFixer/src/main/resources/db.properties)
4. Select project and do maven install to install al required dependency
5. Add tomcat server in eclipse
6. Run this project on server
7. Hit the path http://localhost:8080/myfixer/
8. Login with admin/admin@123 credentials and you go..

Now This is your application up and now to learn diferent things like Spring Security, Hiberante need to make different tweak so you will learn yourself

Required parts explaned [here](https://withubr.com/spring5mvc-hibernate5-springsecurity5-annotationconfig)
