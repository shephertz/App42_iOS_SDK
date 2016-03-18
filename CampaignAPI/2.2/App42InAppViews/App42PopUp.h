//
//  App42PopUp.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 07/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App42IAMViewController.h"

@interface App42PopUp : UIView

@property(nonatomic,weak) id<App42IAMViewControllerDelagates>delegate;

-(void)buildPopUpFromData:(App42PopUpData*)popUpData;

@end
