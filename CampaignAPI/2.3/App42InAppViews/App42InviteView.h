//
//  App42InviteView.h
//  App42CampaignAPISample
//
//  Created by Rajeev Ranjan on 29/11/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App42IAMViewController.h"
#import <MessageUI/MessageUI.h>

@interface App42InviteView : UIView<MFMailComposeViewControllerDelegate>

@property(nonatomic,weak) id<App42IAMViewControllerDelagates>delegate;
@property(nonatomic,weak) App42IAMViewController *controller;

-(void)buildInviteViewFromData:(App42InviteData*)inviteData;

@end
