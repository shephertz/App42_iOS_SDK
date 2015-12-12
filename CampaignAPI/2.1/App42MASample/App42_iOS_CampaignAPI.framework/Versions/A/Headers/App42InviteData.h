//
//  App42InviteData.h
//  App42_iOS_CampaignAPI
//
//  Created by Rajeev Ranjan on 30/11/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "App42CustomDialogueData.h"

@interface App42InviteData : App42CustomDialogueData

@property(nonatomic) NSArray  *channels;
@property(nonatomic) NSString *referralUrl;

-(instancetype)initWithInviteData:(NSDictionary*)inviteData;

@end
