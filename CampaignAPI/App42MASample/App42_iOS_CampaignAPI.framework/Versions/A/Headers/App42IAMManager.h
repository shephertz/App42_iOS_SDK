//
//  App42IAMManager.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 05/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "App42EventDelegate.h"
#import "App42InAppListener.h"
//#import "App42IAMViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface App42IAMManager : NSObject<App42EventDelegate,CLLocationManagerDelegate>

@property(nonatomic) NSMutableDictionary *config;
@property(nonatomic) id<App42InAppListener> listener;

+(instancetype)sharedInstance;

-(void)initialize;

-(void)executeTrackEventWithName:(NSString*)eventName properties:(NSDictionary*)props;
-(void)executeOpenURL:(NSString*)url;

-(void)executeABTestWithName:(NSString*)name;
-(void)executeCustomCodeWithName:(NSString*)name properties:(NSDictionary*)props;
-(void)couponRedeemed:(NSString*)couponCode completionBlock:(App42ResponseBlock)completionBlock;
-(BOOL)isViralityEnabled;
-(void)showInvitePanel:(App42ResponseBlock)completionBlock;

-(NSString*)getActiveViralityCampaign;
-(NSArray*)getAllActiveViralityCampaigns;
-(void)getRewardOfUser:(NSString *)userName completionBlock:(App42ResponseBlock)l_completionBlock;
-(void)redeemRewardForUser:(NSString *)userName rewardPoint:(float)rewardPoint inUnit:(NSString *)rewardUnit completionBlock:(App42ResponseBlock)l_completionBlock;
-(void)getRewardOfUser:(NSString*)userName forCampaign:(NSString*)campName completionBlock:(App42ResponseBlock)l_completionBlock;
-(void)redeemRewardForUser:(NSString*)userName rewardPoint:(float)rewardPoint inUnit:(NSString*)rewardUnit forCampaign:(NSString*)campName completionBlock:(App42ResponseBlock)l_completionBlock;

@end
