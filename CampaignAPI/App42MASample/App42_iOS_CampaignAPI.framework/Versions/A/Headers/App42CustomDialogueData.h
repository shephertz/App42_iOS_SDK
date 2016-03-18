//
//  App42CustomDialogueData.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 02/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "App42InAppData.h"


@interface App42CustomDialogueData : App42InAppData

/**
 *
 */
@property(nonatomic) NSString *title;
@property(nonatomic) int titleColor;
@property(nonatomic) NSString *message;
@property(nonatomic) int messageTextColor;
@property(nonatomic) NSString *backgroundImage;
@property(nonatomic) int backgroundColor;
@property(nonatomic) NSString *submitBtnTitle;
@property(nonatomic) NSString *cancelBtnTitle;
@property(nonatomic) int btnTitleColor;
@property(nonatomic) int btnBackgroundColor;


-(instancetype)initWithDialogueInfo:(NSDictionary *)info;

@end
