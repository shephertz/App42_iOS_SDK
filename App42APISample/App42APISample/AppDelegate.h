//
//  AppDelegate.h
//  App42APISample
//
//  Created by Rajeev Ranjan on 24/03/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSString*)getDeviceToken;
@end

