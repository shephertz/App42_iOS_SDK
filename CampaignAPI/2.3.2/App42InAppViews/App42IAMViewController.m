//
//  App42IAMViewController.m
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 05/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42IAMViewController.h"
#import "App42Alert.h"
#import "App42PopUp.h"
#import "App42Interstitial.h"
#import "App42SurveyForm.h"
#import "App42InviteView.h"
#import "App42CustomView.h"

@interface App42IAMViewController ()
{
    id alertData;
}
@end

@implementation App42IAMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showDialogueWithData:(id)data andType:(App42IAMDialogueType)type
{
    alertData = data;
    switch (type) {
        case kApp42_Alert:
        case kApp42_AlertConfirm:
            [App42Alert showAlertWithInfo:data delegate:self];
            break;
        case kApp42_PopUp:
        {
            App42PopUpData *popUpData = (App42PopUpData*)data;
            float x = (self.view.bounds.size.width-popUpData.popUpWidth)/2;
            float y = (self.view.bounds.size.height-popUpData.popUpHeight)/2;
            
            App42PopUp *popUp = [[App42PopUp alloc] initWithFrame:CGRectMake(x, y, popUpData.popUpWidth, popUpData.popUpHeight)];
            [popUp buildPopUpFromData:popUpData];
            popUp.delegate = self;
            [self.view addSubview:popUp];
        }
            break;
        case kApp42_Interstitial:
        {
            App42InterstitialData *interstitialData = (App42InterstitialData*)data;
            UIImage *bgImage = [UIImage imageNamed:[interstitialData backgroundImage]];
            App42Interstitial *intersttitial = [[App42Interstitial alloc] initWithImage:bgImage];
            intersttitial.frame = self.view.frame;
            intersttitial.userInteractionEnabled = YES;
            [intersttitial buildInterstitial:interstitialData];
            intersttitial.delegate = self;
            [self.view addSubview:intersttitial];
            
        }
            break;
        case kApp42_Survey:
        {
            App42SurveyFormData *surveyData = (App42SurveyFormData*)data;
            App42SurveyForm *surveyForm = [[App42SurveyForm alloc] initWithFrame:self.view.frame];
            [surveyForm buildSurveyForm:surveyData];
            surveyForm.delegate = self;
            [self.view addSubview:surveyForm];
        }
            break;
        case kApp42_Invite:
        {
            App42InviteData *inviteData = (App42InviteData*)data;
            App42InviteView *inviteView = [[App42InviteView alloc] initWithFrame:self.view.frame];
            inviteView.controller = self;
            [inviteView buildInviteViewFromData:inviteData];
            inviteView.delegate = self;
            [self.view addSubview:inviteView];
        }
            break;
        case kApp42_Custom:
        {
            App42CustomViewData *customViewData = (App42CustomViewData*)data;
            App42CustomView *customView = [[App42CustomView alloc] initWithFrame:[self getCustomViewFrame:customViewData]];
            //customView.controller = self;
            [customView buildCustomViewFromData:customViewData];
            customView.delegate = self;
            [self.view addSubview:customView];
            //customView.center = CGPointMake(customView.center.x, [self getCustomViewYPosition:customViewData]);
            [self setCustomViewYPosition:customView forGravity:[customViewData getGravity]];
        }
            break;
        default:
            break;
    }
}

-(CGRect)getCustomViewFrame:(App42CustomViewData *)customViewData
{
    float ratio = 0.1f;
    CGRect frame;
    if ([customViewData getGravity]==kApp42_Top) {
        frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*ratio);
    }
    else if ([customViewData getGravity]==kApp42_Bottom) {
        frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*ratio);
    }
    else
    {
       ratio = 0.5f;
       frame = CGRectMake(10, 0, self.view.frame.size.width-20, self.view.frame.size.height*ratio);
    }
   
    return frame;
}

-(float)getCustomViewYPosition:(App42CustomViewData *)customViewData
{
    float y_pos;
    if ([customViewData getGravity]==kApp42_Top) {
        y_pos = 0;
    }
    else if ([customViewData getGravity]==kApp42_Bottom) {
        y_pos = self.view.frame.size.height-self.view.frame.size.height*0.1f;
    }
    else
    {
        y_pos = self.view.center.y;
    }
    
    return y_pos;
}

-(void)setCustomViewYPosition:(App42CustomView *)customView forGravity:(App42IAMLayoutGravity)gravity
{
    float y_pos;
    if (gravity==kApp42_Top) {
        y_pos = customView.frame.size.height/2;
    }
    else if (gravity==kApp42_Bottom) {
        y_pos = self.view.frame.size.height-customView.frame.size.height/2;
    }
    else
    {
        y_pos = self.view.center.y;
    }
    customView.center = CGPointMake(customView.center.x, y_pos);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark- --- Alert View Delegates ---

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self onSubmitAction];
    }
    else
    {
        [self onCancelAction];
    }
}

#pragma mark- --- App42IAMViewController Delegates ---

-(void)updateSubmitProps:(NSDictionary*)props
{
    App42Action *okBtnAction = [alertData app42Action];
    [okBtnAction.actionProperties addEntriesFromDictionary:props];
    NSArray *names = [okBtnAction.actionName componentsSeparatedByString:@"-"];
    if (names) {
        okBtnAction.actionName = [NSString stringWithFormat:@"%@_%@",[names objectAtIndex:0],[names objectAtIndex:1]];
    }
}

-(void)updateCancelProps:(NSDictionary*)props
{
    App42Action *cancelAction = [alertData app42CancelAction];
    [cancelAction.actionProperties addEntriesFromDictionary:props];
    NSArray *names = [cancelAction.actionName componentsSeparatedByString:@"-"];
    if (names) {
        cancelAction.actionName = [NSString stringWithFormat:@"%@_%@",[names objectAtIndex:0],[names objectAtIndex:1]];
    }
}

-(void)onSubmitAction
{
   // NSLog(@"%s",__func__);
    App42Action *okBtnAction = [alertData app42Action];
    if (okBtnAction) {
        if ([okBtnAction.actionType isEqualToString:APP42IAM_TRACKEVENT])
        {
            [[App42IAMManager sharedInstance] executeTrackEventWithName:okBtnAction.actionName properties:okBtnAction.actionProperties];
        }
        else if ([okBtnAction.actionType isEqualToString:APP42IAM_OPENURL])
        {
            [[App42IAMManager sharedInstance] executeOpenURL:okBtnAction.actionName];
        }
        else if ([okBtnAction.actionType isEqualToString:APP42IAM_ABTEST])
        {
            [[App42IAMManager sharedInstance] executeABTestWithName:okBtnAction.actionName];
        }
        else if ([okBtnAction.actionType isEqualToString:APP42IAM_CUSTOMCODE])
        {
            [[App42IAMManager sharedInstance] executeCustomCodeWithName:okBtnAction.actionName properties:okBtnAction.actionProperties];
        }
    }
    
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}

-(void)onCancelAction
{
    //NSLog(@"%s",__func__);
    App42Action *cancelAction = [alertData app42CancelAction];
    
    if (cancelAction) {
        if ([cancelAction.actionType isEqualToString:APP42IAM_TRACKEVENT])
        {
            [[App42IAMManager sharedInstance] executeTrackEventWithName:cancelAction.actionName properties:cancelAction.actionProperties];
        }
        else if ([cancelAction.actionType isEqualToString:APP42IAM_OPENURL])
        {
            [[App42IAMManager sharedInstance] executeOpenURL:cancelAction.actionName];
        }
        else if ([cancelAction.actionType isEqualToString:APP42IAM_ABTEST])
        {
            [[App42IAMManager sharedInstance] executeABTestWithName:cancelAction.actionName];
        }
        else if ([cancelAction.actionType isEqualToString:APP42IAM_CUSTOMCODE])
        {
            [[App42IAMManager sharedInstance] executeCustomCodeWithName:cancelAction.actionName properties:cancelAction.actionProperties];
        }
    }
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


@end
