
# Table of Contents 
- [Application Demo](#application-demo)
  * [Login & Welcome Page](#login-and-welcome-page)
  * [Main features](#main-features)
  * [Playing around with JS](#playing-around-with-js)
- [Project Structure](#project-structure)
- [Technologies](#technologies)
  * [Architecture](#architecture)
  * [Libraries](#libraries)
  * [Other resources](#other-resources)
- [How to run](#how-to-run)




<!-- toc -->


## Application Demo


### Login and Welcome Page 

![app_demo_part_1](https://user-images.githubusercontent.com/37666186/44115665-c39519c2-a00e-11e8-9a45-5b84e0db8b18.gif)

### Main features

![app_demo_part_2](https://user-images.githubusercontent.com/37666186/44117828-ad4c6ac0-a014-11e8-9d14-4a031f666cf5.gif)

### Playing around with JS

![app_demo_part_3](https://user-images.githubusercontent.com/37666186/44118719-51581fc2-a017-11e8-9aed-241cce003011.gif)





## Project Structure

* spring-boot-web-application
  * src/main/java
    + com.first.springboot.web.springbootwebapplication
      * SpringBootWebApplication.java - main 
    + com.first.springboot.web.springbootwebapplication.controller
      * Controllers
    + com.first.springboot.web.springbootwebapplication.model
      * Todo.java - Entity class for database 
    + com.first.springboot.web.springbootwebapplication.secuity
      * Security Configuration
    + com.first.springboot.web.springbootwebapplication.serice
      * Database repository and service
  * scr/main/resources
    + application.properties
    + data.sql - initializing database
    + test-server.ldif - users database ( LDAP )
    + /static/css
      * CSS styles 
    + /static/img
      * Images
    + /static/js
      * JS scripts
  * scr/main/webapp/WEB-INF/jsp
    + jsp files
    + /common
      * shared jsp files
  * pom.xml

## Technologies
* Java 8
* Maven
* Spring 
  * Boot 
  * WEB
  * H2 / JPA 
  * DevTools
  * Security
  * LDAP
* HTML/CSS/JavaScript
* JSTL

### Libraries
* Bootstrap
* JQuery

### Architecture

* Typical Java EE architecture
* MVC 

### Other resources

* Clouds created basing on this online tutorial: 
https://www.clicktorelease.com/blog/how-to-make-clouds-with-css-3d/


## How to run

* Eclipse IDE Photon 
  * File -> Import -> Existing Maven Project -> Choose Project Directory ( spring-boot-web-application ) -> Right-click SpringBootWebApplication.java -> Run as Java application -> Go to your browser -> Type address localhost:8999 

* Servers 
  * Apache Tomcat - Test server for building application
  * Embedded Apache Directory Server  - Test server for LDAP






