//
//  InAppListener.h
//  App42CampaignAPISample
//
//  Created by Rajeev Ranjan on 27/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <App42_iOS_CampaignAPI/App42_iOS_CampaignAPI.h>

@interface InAppListener : NSObject<App42InAppListener>

@property(nonatomic) NSString *couponCode;

-(instancetype)initWithViewController:(UIViewController*)controller;

@end
