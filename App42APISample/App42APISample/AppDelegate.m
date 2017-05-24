//
//  AppDelegate.m
//  App42APISample
//
//  Created by Rajeev Ranjan on 24/03/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "AppDelegate.h"
#import "App42ServiceList.h"
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>

#define APP_Key     @"b7915f2fca1fb7f53f4f519d6d79dae11b7c948ccc5511ef5ad9d19eceb6376f"
#define SECRET_Key  @"f5f1d84b849d459ef3217ef12ffd2931474379783402711c23908b464629ecdf"


@interface AppDelegate ()
{
    NSString *deviceToken;
}
@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [App42API initializeWithAPIKey:APP_Key andSecretKey:SECRET_Key];
    [App42API enableApp42Trace:YES];
    [App42API enableEventService:YES];
    [App42API enableAppAliveTracking:YES];
    [App42API enableAppStateEventTracking:YES];
    
    deviceToken = nil;
    
    App42ServiceList *serviceList = [[App42ServiceList alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:serviceList];
    
    [self.window setRootViewController:navController];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Let the device know we want to receive push notifications
    // Register for Push Notitications, if running on iOS 8
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    }
    /*else
    {
        // Register for Push Notifications, if running iOS version < 8
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    }*/
    
    return YES;
}



#pragma mark- Push Delagates

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    NSLog(@"%s",__func__);
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken1
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"My token is: %@", deviceToken1);
    // Prepare the Device Token for Registration (remove spaces and < >)
    deviceToken = [[NSString alloc] initWithString:[[[[deviceToken1 description]
                                                      stringByReplacingOccurrencesOfString:@"<"withString:@""]
                                                     stringByReplacingOccurrencesOfString:@">" withString:@""]
                                                    stringByReplacingOccurrencesOfString:@" " withString: @""]];
}

-(NSString*)getDeviceToken
{
    return deviceToken;
}

-(void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"Failed to get token, error: %@", error);
}


-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"%s....%@",__func__,userInfo);
    completionHandler(UIBackgroundFetchResultNoData);
}


#pragma mark- App State Delegates

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
