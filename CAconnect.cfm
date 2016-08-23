<cfscript>
    // Call the Service Desk web service
    ws = CreateObject("webservice", "ServiceDesk");

    // Call the login method to get the sid you will need your SD admin create a generic login and pass to create tickets
    username = "GenericHelp";
    password = "somepass";

    sid = ws.login(username, password);

    writeoutput(sid);

    // Call method to get the user handle
    // need to add cn for this part in form for now hardcoding my cn requestor.usrName_req
    // the usernames can be querys from another DB as long as the username in in service desk
    userhandle = ws.getHandleForUserid(sid,"username");
    if (usrInfo.cn_usr eq ''){
    	customerhandle = userhandle;
	}else{
    	customerhandle = ws.getHandleForUserid(sid,"customerusername");
    }
    writeoutput(userhandle);

    //Call method to create new service request
    //attrVal = {customer=userhandle, category="sosrinu", description="test request"};
    category = "pcat:404273";
    summary = "Network Access Test Request";
    description = Query.fromMyDatabase; 
    customer = "someperson";
    // sched_start_date = "8/31/2015 03:00pm";
    attrVal = [];
    attrVal = ["requested_by", userhandle, "customer", customerhandle, "category", category,"summary", summary, "description", description];
    requestHandle = "";
    requestNumber = "";
    template = "";
    prop = [];
    attr = ["persistent_id"];
    myRequest = ws.createRequest(sid, userhandle, attrVal, prop, template, attr, requestHandle, requestNumber);

    writeoutput(myRequest);
</cfscript>
