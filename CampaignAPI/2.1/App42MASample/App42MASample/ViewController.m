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


#define APP_Key     @"b7915f2fca1fb7f53f4f519d6d79dae11b7c948ccc5511ef5ad9d19eceb6376f"
#define SECRET_Key  @"f5f1d84b849d459ef3217ef12ffd2931474379783402711c23908b464629ecdf"

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
    [App42API setLoggedInUser:@"Rajeev"];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
