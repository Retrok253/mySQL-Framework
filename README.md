# MySQL-Framework for Gothic 2 Online.

```
//Example get row
local name = "nickname";
local pass = "secretpassword";

local result = MySQL.Get("SELECT * FROM accounts WHERE name = '"+ name +"'");
	if(result){
		if(result["password"] == sha256(pass)){
		
		}
	}
}
//
```
