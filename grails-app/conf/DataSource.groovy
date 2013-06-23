/*
dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
*/

dataSource {
  pooled = true
  driverClassName = "org.firebirdsql.jdbc.FBDriver" 
  //"org.hsqldb.jdbcDriver"
  dialect="org.hibernate.dialect.FirebirdDialect"
  username = "SYSDBA"
  password = "masterke"
  //logSql=true
}

hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
  development {
    dataSource {
      dbCreate = "update"
      //"create-drop" // one of 'create', 'create-drop','update'
      //url = "jdbc:firebirdsql://localhost//home/debian/GAOBase/GAO.fdb" //"jdbc:hsqldb:file:deveDb;shutdown=true"
      url = "jdbc:firebirdsql://localhost/c:/Projects/DB/GAO.FDB"
	  //"jdbc:firebirdsql://localhost//home/debian/GAOBase/GAO.fdb"
      //logSql=true
    }
  }
  test {
    dataSource {
      dbCreate = "update"
      url = "jdbc:hsqldb:mem:testDb"
    }
  }
  production {
    dataSource {
      dbCreate = "update"
      jndiName = "java:comp/env/jdbc/gao"
      //url = "jdbc:firebirdsql://localhost/c:/Ash/Projects/gao.fdb"
    }
  }
}