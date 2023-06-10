# MySQL-Framework for Gothic 2 Online.
To connect with MySQL open the config.nut file and change details

Example loading framework to server
```
	<module src="mySQL/MySQL.so" type="server"/>
	<script src="mySQL/mySQL.nut" type="server" />
	<script src="config.nut" type="server" />
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
