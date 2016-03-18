//
//  App42PopUpData.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 05/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "App42CustomDialogueData.h"

@interface App42PopUpData : App42CustomDialogueData

/***
 * Set and get popUpWidth
 */
@property(nonatomic) float popUpWidth;

/***
 * Set and get popUpHeight
 */
@property(nonatomic) float popUpHeight;


-(instancetype)initWithPopUpData:(NSDictionary*)popUpData;

@end
