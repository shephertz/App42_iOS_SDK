//
//  App42IAppData.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 30/12/14.
//  Copyright (c) 2014 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "App42Action.h"

@interface App42InAppData : NSObject

/**
 * Provides setter & getter for app42CampaignName
 */
@property(nonatomic) NSString *app42CampaignName;


/**
 * Provides setter & getter for app42DialogueType
 */
@property(nonatomic) NSString *app42DialogueType;

/**
 * Provides setter & getter for app42Action
 */
@property(nonatomic) App42Action *app42Action;

/**
 * Provides setter & getter for app42CancelAction
 */
@property(nonatomic) App42Action *app42CancelAction;

/**
 * Provides setter & getter for app42CouponCode
 */
@property(nonatomic) NSString *app42CouponCode;


-(instancetype)initWithInfo:(NSDictionary*)info;

@end
