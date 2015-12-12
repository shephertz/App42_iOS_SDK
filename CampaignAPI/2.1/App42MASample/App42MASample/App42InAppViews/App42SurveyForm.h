//
//  App42SurveyForm.h
//  App42_iOS_CampaignAPI
//
//  Created by Rajeev Ranjan on 16/06/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42IAMViewController.h"

@interface App42SurveyForm : UIView

@property(nonatomic,weak) id<App42IAMViewControllerDelagates>delegate;

-(void)buildSurveyForm:(App42SurveyFormData*)surveyData;

@end
