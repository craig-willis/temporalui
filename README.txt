Setup log

1. Using GGTS, create new project

2. Install Spring security
   http://grails-plugins.github.io/grails-spring-security-core/guide/single.html#tutorials
   Edit BuildConfig.groovy, add spring securit
   Create User and Role 
   grails s2-quickstart edu.gslis.temporalui User Role
   Override the default login pages...

   grails s2ui-override auth

3. Create controller
   grails create-controller Collections
   grails create-controller Queries

