//
//  App42CampaignAPI.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 15/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "App42InAppListener.h"
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>

@interface App42CampaignAPI : NSObject

/***
 * Initialises App42CampaignAPI and sync client with the App42 Server
 */
+(void)initWithListener:(id<App42InAppListener>)listener;

/***
 * Enable is deprecated, please use initWithListener instead
 */
+(void)enable:(BOOL)isEnable;

/***
 * Sets the refresh time(in minutes) after which client tries to sync with server again, default is 24 hrs
 */
+(void)setConfigCacheTime:(double)cacheTime;

/***
 * Get current refresh time
 */
+(double)getConfigCacheTime;

/***
 *  Tracks the redeemed coupons
 *  @params: couponCode - Coupon code which was redeemed
 */
+(void)couponRedeemed:(NSString*)couponCode completionBlock:(App42ResponseBlock)completionBlock;

/***
 *  Tracks the invites
 *
 */
+(void)showInvitePanel:(App42ResponseBlock)completionBlock;

/***
 * Checks if virality campaigns are available
 */
+(BOOL)isViralityAvailable;

/***
 * Gets rewards points for user for a given campaign
 * @params: usreName - Name of the user whose rewards needs to be fetched
 * @params: campName - CampaignName from which rewards was earned
 */
+(void)getRewardOfUser:(NSString*)userName forCampaign:(NSString*)campName completionBlock:(App42ResponseBlock)l_completionBlock;

/***
 * Gets rewards points for user for an active campaign
 * @params: usreName - Name of the user whose rewards needs to be fetched
 * @params: campName - CampaignName from which rewards was earned
 */
+(void)getRewardOfUser:(NSString *)userName completionBlock:(App42ResponseBlock)l_completionBlock;

/***
 * Redeem rewards points for user for a given campaign
 * @params: usreName    - Name of the user whose rewards needs to be fetched
 * @params: rewardPoint - Number of points needs to be redeemed
 * @params: rewardUnit  - Units in which reward will be redeemed
 * @params: campName    - CampaignName from which rewards was earned
 */
+(void)redeemRewardForUser:(NSString*)userName rewardPoint:(float)rewardPoint inUnit:(NSString*)rewardUnit forCampaign:(NSString*)campName completionBlock:(App42ResponseBlock)l_completionBlock;

/***
 * Redeem rewards points for user for an active campaign
 * @params: usreName    - Name of the user whose rewards needs to be fetched
 * @params: rewardPoint - Number of points needs to be redeemed
 * @params: rewardUnit  - Units in which reward will be redeemed
 */
+(void)redeemRewardForUser:(NSString *)userName rewardPoint:(float)rewardPoint inUnit:(NSString *)rewardUnit completionBlock:(App42ResponseBlock)l_completionBlock;

/***
 * Gets an active campaign
 * @return: campaign name
 */
+(NSString*)getActiveViralityCampaign;

/***
 * Gets a list of active campaign
 * @return: Array of campaign names
 */
+(NSArray*)getAllActiveViralityCampaigns;

@end
