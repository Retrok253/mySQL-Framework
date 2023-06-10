# MySQL-Framework for Gothic 2 Online.
To connect with MySQL download module from https://forum.gothic-online.com.pl/topic/30-mysql/ and add to server with mySQL-Framework, later open the config.nut file and change details

Example loading framework with module to server (Ubuntu 18.04.6 LTS)
```
	<module src="MySQL.x64.so" type="server"/>
	<script src="config.nut" type="shared" />
	<script src="mySQL/mySQL.nut" type="server" />
```
Example get function
```
local name = "nickname";
local pass = "secretpassword";

local result = MySQL.Get("SELECT * FROM accounts WHERE name = '"+ name +"'");
	if(result){
		if(result["password"] == sha256(pass)){
		
		}
	}
}
```
Example set function
```
local name = "nickname";
local pass = "secretpassword";

local result = MySQL.Get("SELECT * FROM accounts WHERE name = '"+ name +"'");
	if(!result){
		if(MySQL.Set("INSERT INTO accounts (name, password) VALUES ('"+ name +"', '"+ sha256(pass) +"')")){ // Insert successful
			print("Success");
		}else{ // Insert failure
			print("Error");
		}
	}
}
```
#Example getAll function
```
local result = MySQL.GetAll("SELECT * FROM accounts");
if(result){
	foreach(i, val in result){
		print(result[i]["name"]);
	}
}
```
