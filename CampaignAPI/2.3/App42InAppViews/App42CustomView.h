//
//  App42CustomView.h
//  App42CampaignAPISample
//
//  Created by Rajeev Ranjan on 19/02/16.
//  Copyright © 2016 Rajeev Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App42IAMViewController.h"

@interface App42CustomView : UIView


@property(nonatomic,weak) id<App42IAMViewControllerDelagates>delegate;

-(void)buildCustomViewFromData:(App42CustomViewData*)customViewData;

@end
