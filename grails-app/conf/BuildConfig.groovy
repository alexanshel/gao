grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir	= "target/test-reports"
grails.plugin.repos.discovery.zkgrails="http://zkgrails.googlecode.com/svn/plugins"
grails.plugin.repos.resolveOrder=['zkgrails','default','core']
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "info" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }

    dependencies {
      compile "org.grails:grails-webflow:$grailsVersion"
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        // runtime 'mysql:mysql-connector-java:5.1.5'
    }

    plugins {
      runtime ":hibernate:$grailsVersion"
      runtime ":jquery:1.8.3"
      runtime ":resources:1.2.RC2"

      // Uncomment these (or add new ones) to enable additional resources capabilities
      //runtime ":zipped-resources:1.0"
      //runtime ":cached-resources:1.0"
      //runtime ":yui-minify-resources:0.1.4"

      build ":tomcat:$grailsVersion"

      runtime ":database-migration:1.1"

      compile ':cache:1.0.0'
      compile ':webflow:2.0.0', {
        exclude 'grails-webflow'
      }
      compile ":lesscss-resources:1.3.3"
      compile ":twitter-bootstrap:2.3.2"
   
  }
}