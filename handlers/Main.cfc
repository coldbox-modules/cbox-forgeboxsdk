/**
* My Event Handler Hint
*/
component{

	property name="forgeboxsdk" inject="forgebox@forgeboxsdk";

	// Index
	any function index( event,rc, prc ){
		prc.data = forgeboxsdk.ping();
	}

	// Run on first init
	any function onAppInit( event, rc, prc ){
	}

}