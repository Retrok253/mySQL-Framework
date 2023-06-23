MySQL <- null;

class mySQL {
	handler = null;

	constructor() {
		mysql_option_reconnect(true);
		this.handler = mysql_connect(Config.Database.host.tostring(), Config.Database.user.tostring(), Config.Database.password.tostring(), Config.Database.database.tostring(),Config.Database.port.tointeger());

		if (this.handler) {
			mysql_set_character_set(this.handler, Config.Database.charset.tostring());
			print("\n-========================================-\nMySQL\n> Connection established.\n-========================================-\n");
		} else {
			print("\n-========================================-\nMySQL\n> Check your database credentials.\n-========================================-\n");
		}
	}

	function set(arg) {
		if (!arg) return print("MySQL Framework: (set) No args provided.");

		local result = mysql_query(this.handler, mysql_real_escape_string(this.handler, arg));

		if (result != null) {
			mysql_free_result(result);
		}

		return (mysql_errno(this.handler) == 0) ? true : false;
	}

	function get(arg) {
		if (!arg) return print("MySQL Framework: (get) No args provided.");

		local result = mysql_query(this.handler, mysql_real_escape_string(this.handler, arg));

		if (result != null) {
			local row = mysql_fetch_assoc(result);
			mysql_free_result(result);
			return row;
		}
	}

	function getAll(arg) {
		if (!arg) return print("MySQL Framework: (getAll) No args provided.");
		
        local result = mysql_query(this.handler, mysql_real_escape_string(this.handler, arg));

		if (result != null) {
			local returnRows = [];
			local count = mysql_num_rows(result);

			for (local i = 0; i < count; ++i) returnRows.push(mysql_fetch_assoc(result));

			mysql_free_result(result);
			return (returnRows.len() == 0) ? false : returnRows;
		}
    }

    function onInit() {
		MySQL = mySQL();
    }
}

addEventHandler("onInit", mySQL.onInit.bindenv(this));
