* To Use this, you also need to integrate the latest version of Shephertz_App42_iOS_API.framework. Please follow the integration steps from here(http://api.shephertz.com/tutorial/Getting-Started-iOS/?index=gs-iossdk)

* Once you have integrated Shephertz_App42_iOS_API.framework then drag and drop the App42_iOS_CampaignAPI.framewrok to left side navigation panel of your project.Make sure “Copy items if needed” check-box is checked.

* Also, drag and drop App42InAppViews folder to add UI related classes.

*Add the following libraries:
	- MessageUI.framework
	- Social.framework
	- CoreLocation.framework

* Add the following key value pair to your info.plist file:
	NSLocationWhenInUseUsageDescription : This will be used to obtain or track your location

* Copy and paste following code snippets to start with App42 Campaigns API
	[App42API initializeWithAPIKey:APP_Key andSecretKey:SECRET_Key];
    	//[App42API enableApp42Trace:YES];
    	[App42API setLoggedInUser:@“Your User Name”];
    	[App42API enableEventService:YES];
	// Here self is the UIView controller where you want to show InApp notifications
    	self.inAppListener = [[InAppListener alloc] initWithViewController:self];
    	[App42CampaignAPI initWithListener:inAppListener];


 