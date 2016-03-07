//
//  InAppListener.m
//  App42CampaignAPISample
//
//  Created by Rajeev Ranjan on 27/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

#import "InAppListener.h"
#import "App42IAMViewController.h"

@interface InAppListener ()
{
    UIViewController *viewContro;
}
@end

@implementation InAppListener
@synthesize couponCode;

-(instancetype)initWithViewController:(UIViewController*)controller
{
    if (self = [super init]) {
        viewContro = controller;
        self.couponCode = nil;
    }
    return self;
}

-(void)onInAppMessageReceived:(id)inAppData withType:(App42IAMDialogueType)type
{
    [self showDialogueWithData:inAppData andType:type];
    self.couponCode = [inAppData app42CouponCode];
}

-(void)showDialogueWithData:(id)data andType:(App42IAMDialogueType)type
{
    App42IAMViewController *viewController = [[App42IAMViewController alloc] init];
    viewController.view.backgroundColor = [UIColor clearColor];
    viewController.providesPresentationContextTransitionStyle = YES;
    viewController.definesPresentationContext = YES;
    viewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [viewContro presentViewController:viewController animated:NO completion:^{
        [viewController showDialogueWithData:data andType:type];
    }];
}

@end
