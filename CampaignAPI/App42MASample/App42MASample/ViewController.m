//
//  ViewController.m
//  App42MASample
//
//  Created by Rajeev Ranjan on 11/12/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

#import "ViewController.h"
#import <App42_iOS_CampaignAPI/App42_iOS_CampaignAPI.h>
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>
#import "InAppListener.h"
#import "App42InviteView.h"


#define APP_Key     @"6ab7a4745c0c2dba0bd40d6d5a60a354c8ab5b72dbc520dafa0536a91b861dc8"
#define SECRET_Key  @"51023784bae2286ca6b3d4d70029892cc089d0e6d297e95c57f50405ce7cab30"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *eventNameField;

@property(nonatomic) InAppListener *inAppListener;

@end

@implementation ViewController
@synthesize inAppListener;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [App42API initializeWithAPIKey:APP_Key andSecretKey:SECRET_Key];
    [App42API enableApp42Trace:YES];
    [App42API setLoggedInUser:@"Sachin"];
    [App42API enableEventService:YES];
    self.inAppListener = [[InAppListener alloc] initWithViewController:self];
    [App42CampaignAPI initWithListener:inAppListener];
    self.inviteButton.hidden = YES;
}

- (IBAction)trackEvent:(id)sender {
    
    NSString *eventName = self.eventNameField.text;
    if (eventName && eventName.length)
    {
        EventService *eventService = [App42API buildEventService];
        NSDictionary *props = [NSDictionary dictionaryWithObjectsAndKeys:@"true",@"purchase", nil];
        [eventService trackEventWithName:eventName andProperties:props completionBlock:^(BOOL success, id responseObj, App42Exception *exception) {
            if (success) {
                App42Response *response = (App42Response*)responseObj;
                NSLog(@"Response = %@",response.strResponse);
            }
            else
            {
                NSLog(@"Exceprion = %@",exception.reason);
            }
        }];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter event name to track!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    [self.eventNameField resignFirstResponder];
}

- (IBAction)isViralityEnabled:(id)sender {
    BOOL isAvailable = [App42CampaignAPI isViralityAvailable];
    NSLog(@"isAvailable = %d",isAvailable);
    if (isAvailable) {
        self.inviteButton.hidden = NO;
    }
    [self.eventNameField resignFirstResponder];
}

- (IBAction)getRewards:(id)sender {
    
    [App42CampaignAPI getRewardOfUser:[App42API getLoggedInUser] forCampaign:@"ShareAndEarn" completionBlock:^(BOOL success, id responseObj, App42Exception *exception) {
        if (success)
        {
            NSArray *rewardsPointsArray = (NSArray*)responseObj;
            for (RewardsPoint *rewardPoint in rewardsPointsArray)
            {
                NSLog(@"UserName = %@",rewardPoint.userName);
                NSLog(@"campaignName = %@",rewardPoint.campaignName);
                NSLog(@"RewardUnit = %@",rewardPoint.rewardUnit);
                NSLog(@"Poins = %f",rewardPoint.points);
            }
            NSLog(@"Response = %@",responseObj);
        }
        else
        {
            NSLog(@"Exceprion = %@",exception.reason);
        }
    }];
    [self.eventNameField resignFirstResponder];
}

- (IBAction)redeemRewards:(id)sender {
    
    [App42CampaignAPI redeemRewardForUser:[App42API getLoggedInUser] rewardPoint:200 inUnit:@"USD" forCampaign:@"ShareAndEarn" completionBlock:
     ^(BOOL success, id responseObj, App42Exception *exception) {
         if (success)
         {
             RewardsPoint *rewardPoint = (RewardsPoint*)responseObj;
             NSLog(@"UserName = %@",rewardPoint.userName);
             NSLog(@"campaignName = %@",rewardPoint.campaignName);
             NSLog(@"RewardUnit = %@",rewardPoint.rewardUnit);
             NSLog(@"Poins = %f",rewardPoint.points);
             NSLog(@"Response = %@",responseObj);
         }
         else
         {
             NSLog(@"Exceprion = %@",exception.reason);
         }
     }];
    [self.eventNameField resignFirstResponder];
}
- (IBAction)inviteButton:(id)sender
{
    [App42CampaignAPI showInvitePanel:^(BOOL success, id responseObj, App42Exception *exception) {
        NSLog(@"Invite Pannel launched");
        NSLog(@"responseObj = %@",responseObj);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
