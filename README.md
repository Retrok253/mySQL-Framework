# mySQL-Framework for Gothic 2 Online.
This framework works at top of this module https://forum.gothic-online.com.pl/topic/30-mysql/, first you have to load this module, then you'd have to load this framework, later open the config.nut file and change your MySQL credentials. Below you can see example XML file on how it should look like.

# Example loading framework with module to server (Ubuntu 18.04.6 LTS)
```xml
	<module src="MySQL.x64.so" type="server"/>
	<script src="config.nut" type="shared" />
	<script src="mySQL/mySQL.nut" type="server" />
```

# Example get function
```js
local username = "nickname";
local password = "secretpassword";

local result = MySQL.get(format("SELECT * FROM accounts WHERE username = %s", username));

if (result) {
	// Account with specified username found.
	if (result["password"] == sha256(password)) {
		// Corrent password.
	} else {
		// Wrong password.
	}
} else {
	// Account with specified username not found.
}
```

# Example set function
```js
local username = "nickname";
local password = "secretpassword";

local result = MySQL.get(format("SELECT * FROM accounts WHERE name = %s", username));

if (!result) {
	if (MySQL.set(format("INSERT INTO accounts (username, password) VALUES (%s, %s)", username, password))) {
		// Insert successful.
	} else {
		// Insert failure.
	}
}
```

# Example getAll function
```js
local result = MySQL.getAll("SELECT * FROM accounts");

if (result) {
	foreach (i, val in result) {
		print(result[i]["name"]);
	}
}
```
