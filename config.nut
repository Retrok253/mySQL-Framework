Config <- {};

if(SERVER_SIDE){
    Config.Database <- {
      host = "localhost",
      port = "3306",
      user = "root",
      password = "test",
      charset = "cp1250", // (PL)
      database = "databasename",
    }
}
