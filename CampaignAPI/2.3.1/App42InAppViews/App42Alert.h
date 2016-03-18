//
//  App42Alert.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 06/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <App42_iOS_CampaignAPI/App42_iOS_CampaignAPI.h>

@interface App42Alert : NSObject

+(void)showAlertWithInfo:(App42AlertData*)alertData delegate:(id)delegate;

@end
