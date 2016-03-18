//
//  App42Action.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 30/12/14.
//  Copyright (c) 2014 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App42Action : NSObject

/**
 * Provides setter & getter for actionType
 */
@property(nonatomic) NSString* actionType;

/**
 * Provides setter & getter for actionName
 */
@property(nonatomic) NSString* actionName;

/**
 * Provides setter & getter for actionProperties
 */
@property(nonatomic) NSMutableDictionary* actionProperties;

/**
 * Provides setter & getter for reward unit
 */
@property(nonatomic) NSString *unit;

/**
 * Provides setter & getter for rewardRules
 */
@property(nonatomic) NSArray  *rewardRules;

-(instancetype)initWithActionInfo:(NSDictionary*)actionInfo;

@end
