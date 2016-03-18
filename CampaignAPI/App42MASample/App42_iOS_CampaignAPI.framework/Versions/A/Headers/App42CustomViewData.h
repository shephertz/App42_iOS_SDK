//
//  App42CustomViewData.h
//  App42_iOS_CampaignAPI
//
//  Created by Rajeev Ranjan on 19/02/16.
//  Copyright © 2016 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "App42CustomDialogueData.h"
#import "App42InAppConstants.h"

@interface App42CustomViewData : App42CustomDialogueData

@property(nonatomic) NSString *iconImage;
@property(nonatomic) NSString *layoutGravity;
@property(nonatomic) NSString *layoutType;
@property(nonatomic) NSString *backColor;
@property(nonatomic) NSDictionary *customTitle;

@property(nonatomic) NSDictionary *message1;
@property(nonatomic) NSDictionary *message2;
@property(nonatomic) NSDictionary *message3;

@property(nonatomic) NSString *crossStatus;
@property(nonatomic) int autoTimeOut;
@property(nonatomic) BOOL roundedCorner;
@property(nonatomic) NSString *cancelBtnImage;

-(instancetype)initWithCustomViewData:(NSDictionary*)customViewData;
-(App42IAMLayoutGravity)getGravity;
-(App42IAMLayoutType)getLayputType;
-(App42IAMLayoutCancelType)getLayoutCancellationType;

@end
