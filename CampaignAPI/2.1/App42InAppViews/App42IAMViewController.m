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
        default:
            break;
    }
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
}

-(void)updateCancelProps:(NSDictionary*)props
{
    App42Action *cancelAction = [alertData app42CancelAction];
    [cancelAction.actionProperties addEntriesFromDictionary:props];
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


-(void)inviteImpression:(NSString*)channelName
{
    NSString *eventName = [NSString stringWithFormat:@"InvteSentVia-%@",channelName]; //Need to configure the event name
    [[App42IAMManager sharedInstance] executeTrackEventWithName:eventName properties:[NSDictionary dictionary]];
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


@end
