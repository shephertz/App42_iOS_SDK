//
//  App42InAppListener.h
//  App42_iOS_CampaignAPI
//
//  Created by Rajeev Ranjan on 27/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "App42InAppData.h"
#import "App42InAppConstants.h"

@protocol App42InAppListener <NSObject>

@optional

-(void)onInAppMessageReceived:(id)inAppData withType:(App42IAMDialogueType)type;

@end
