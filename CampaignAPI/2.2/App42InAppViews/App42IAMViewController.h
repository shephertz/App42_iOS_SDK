//
//  App42IAMViewController.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 05/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <App42_iOS_CampaignAPI/App42_iOS_CampaignAPI.h>

@protocol App42IAMViewControllerDelagates <NSObject>

-(void)onSubmitAction;
-(void)onCancelAction;
-(void)updateSubmitProps:(NSDictionary*)props;
-(void)updateCancelProps:(NSDictionary*)props;

@end


@interface App42IAMViewController : UIViewController<App42IAMViewControllerDelagates>

-(void)showDialogueWithData:(id)data andType:(App42IAMDialogueType)type;
@end
