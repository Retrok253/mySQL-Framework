MySQL <- null;

class mySQL{

	mySQL_Handler = null;

	constructor(){
		mysql_option_reconnect(true);
		mySQL_Handler = mysql_connect(Config.Database.host.tostring(), Config.Database.user.tostring(), Config.Database.password.tostring(), Config.Database.database.tostring(),Config.Database.port.tointeger());
		if(mySQL_Handler)
			mysql_query(mySQL_Handler, "SET NAMES "+Config.Database.charset.tostring());
		
		print((mySQL_Handler) ? "\n-========================================-\nMySQL: Connected.\n-========================================-\n" : "\n-========================================-\nMySQL: Not connected.\n-========================================-\n");
	}
	
	function Set(arg){
		if(arg){
			local result = mysql_query(mySQL_Handler, arg);
			if(result != null)
				mysql_free_result(result);
					
			return (mysql_errno(mySQL_Handler) == 0) ? true : false;
		}
	}
	
	function Get(arg){
		if(arg){
			local result = mysql_query(mySQL_Handler, arg);
			if(result != null){
				local row = mysql_fetch_assoc(result);
				mysql_free_result(result);
				return row;
			}
		}
	}
	
	function GetAll(arg){
        if(arg){
			local result = mysql_query(mySQL_Handler, arg);
			if(result != null){
				local returnRows = [];
				local count = mysql_num_rows(result);
				for(local i = 0; i < count; ++i)
					returnRows.push(mysql_fetch_assoc(result));
								
				mysql_free_result(result);
				
				return (returnRows.len() == 0) ? false : returnRows;
			}
        }
    }
	
    function onInit(){
	MySQL = mySQL();
    }
}
addEventHandler("onInit", mySQL.onInit.bindenv(this));
