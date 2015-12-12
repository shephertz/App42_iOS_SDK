//
//  App42AlertData.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 05/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42InAppData.h"

@interface App42AlertData : App42InAppData

/***
 * Setter and getter for title
 */
@property(nonatomic) NSString *title;

/***
 * Setter and getter for message
 */
@property(nonatomic) NSString *message;

/***
 * Setter and getter for submitBtnTitle
 */
@property(nonatomic) NSString *submitBtnTitle;

/***
 * Setter and getter for cancelBtnTitle
 */
@property(nonatomic) NSString *cancelBtnTitle;


-(instancetype)initWithAlertData:(NSDictionary*)alertData;

@end
