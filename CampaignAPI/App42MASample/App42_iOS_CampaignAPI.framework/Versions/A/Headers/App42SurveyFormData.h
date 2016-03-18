//
//  App42SurveyFormData.h
//  App42_iOS_CampaignAPI
//
//  Created by Rajeev Ranjan on 16/06/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42CustomDialogueData.h"

@interface App42SurveyFormData : App42CustomDialogueData

@property(nonatomic) NSArray *questions;

-(instancetype)initWithSurveyData:(NSDictionary*)surveyData;
@end
