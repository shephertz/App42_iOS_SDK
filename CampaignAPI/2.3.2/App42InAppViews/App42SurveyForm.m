//
//  App42SurveyForm.m
//  App42_iOS_CampaignAPI
//
//  Created by Rajeev Ranjan on 16/06/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42SurveyForm.h"

@interface App42SurveyForm ()
{
    id selectedOption;
    NSMutableArray *optionsArray;
    UIButton *submitButton;
}
@end

@implementation App42SurveyForm

-(void)buildSurveyForm:(App42SurveyFormData*)surveyData
{
    self.backgroundColor = [UIColor colorWithRed:17.0/255.0 green:95.0/255.0 blue:152.0/255.0 alpha:1.0];
    
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    
    /**
     * Title Label
     */
    UILabel *surveyTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 200, 0)];
    surveyTitle.font = [UIFont systemFontOfSize:24];
    surveyTitle.textColor = [UIColor whiteColor];
    surveyTitle.text = surveyData.title;
    surveyTitle.textAlignment = NSTextAlignmentCenter;
    [surveyTitle sizeToFit];
    [self addSubview:surveyTitle];
    surveyTitle.center = CGPointMake(width/2, height*0.15);

    /**
     * Questions BG
     */
    UIScrollView *questionsBg = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width*0.9, height*0.5)];
    questionsBg.contentSize = CGSizeMake(width*0.9, height*0.5);
    questionsBg.center = CGPointMake(width/2, height/2);
    questionsBg.backgroundColor = [UIColor whiteColor];
    [self addSubview:questionsBg];
    
    
    float x_offset = 0.25;
    /**
     * Cancel Button
     */
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width*0.9, 50)];
    buttonView.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];
    [self addSubview:buttonView];
    buttonView.center = CGPointMake(width/2, questionsBg.center.y+questionsBg.frame.size.height/2);
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.backgroundColor = [UIColor colorWithRed:190.0/255.0 green:0.0/255.0 blue:8.0/255.0 alpha:1.0];
    cancelButton.frame = CGRectMake(0, 5, 100, 40);
    [cancelButton setTitle:surveyData.cancelBtnTitle forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents: UIControlEventTouchUpInside];
    cancelButton.center = CGPointMake(buttonView.frame.size.width*x_offset, cancelButton.center.y);
    [buttonView addSubview:cancelButton];
    
    /**
     * Submit Button
     */
    submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:31.0/255.0 alpha:1.0];
    submitButton.frame = CGRectMake(0, 5, 100, 40);
    [submitButton setTitle:surveyData.submitBtnTitle forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submitButtonAction:) forControlEvents: UIControlEventTouchUpInside];
    submitButton.center = CGPointMake(buttonView.frame.size.width*(1-x_offset), submitButton.center.y);
    [buttonView addSubview:submitButton];
    submitButton.enabled = NO;
    
    NSArray *questions = surveyData.questions;
    float questionBGHeight = 20;
    for (NSDictionary *questionDict in questions)
    {
        /**
         * Question
         */
        UIView *questionView = [[UIView alloc] init];
        questionView.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];
        [questionsBg addSubview:questionView];
        
        UILabel *question = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, questionsBg.frame.size.width*0.9, 0)];
        question.font = [UIFont systemFontOfSize:24];
        question.text = [questionDict objectForKey:APP42IAM_TEXT];
        question.numberOfLines = 0;
        question.textAlignment = NSTextAlignmentCenter;
        [question sizeToFit];
        [questionView addSubview:question];
        question.center = CGPointMake(questionsBg.frame.size.width/2, question.center.y);
        questionView.frame = CGRectMake(0, 0, questionsBg.frame.size.width, question.bounds.size.height+20);
        
        questionBGHeight = questionBGHeight + questionView.bounds.size.height;
        
        NSString *optionType = [questionDict objectForKey:APP42IAM_TYPE];
        NSString *normalImagePath = @"";
        NSString *selectedImagePath = @"";
        if ([optionType isEqualToString:@"radioButton"])
        {
            normalImagePath = [NSString stringWithFormat:@"%@/%@",[App42IAMConfigHandler app42ImageFolderPath],APP42IAM_RADIOBUTTON_OFF];
            selectedImagePath = [NSString stringWithFormat:@"%@/%@",[App42IAMConfigHandler app42ImageFolderPath],APP42IAM_RADIOBUTTON_ON];
        }
        else
        {
            normalImagePath = [NSString stringWithFormat:@"%@/%@",[App42IAMConfigHandler app42ImageFolderPath],APP42IAM_CHECKBOX];
            selectedImagePath = [NSString stringWithFormat:@"%@/%@",[App42IAMConfigHandler app42ImageFolderPath],APP42IAM_CHECKBOX_SELECTED];
        }
        
        
        /**
         * Answers
         */
        float y_offset = questionBGHeight;
        NSArray *answers = [questionDict objectForKey:APP42IAM_ANSWERS];
        for (NSDictionary *answer in answers)
        {
            float x_offset_button = width*0.75;

            UILabel *optionA = [[UILabel alloc] initWithFrame:CGRectMake(10, y_offset, x_offset_button, 0)];
            optionA.font = [UIFont systemFontOfSize:18];
            optionA.numberOfLines = 0;
            optionA.text = [answer objectForKey:APP42IAM_TEXT];
            //optionA.textAlignment = NSTextAlignmentCenter;
            [optionA sizeToFit];
            [questionsBg addSubview:optionA];
            
            x_offset_button = x_offset_button + 10;

            UIButton *optionButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [optionButton setImage:[UIImage imageNamed:normalImagePath] forState:UIControlStateNormal];
            [optionButton setImage:[UIImage imageNamed:selectedImagePath] forState:UIControlStateSelected];
            NSString *tagName = [NSString stringWithFormat:@"%@,%@,%@",[questionDict objectForKey:APP42IAM_VALUE],[answer objectForKey:APP42IAM_VALUE],optionType];
            [optionButton setTitle:tagName forState:UIControlStateDisabled];
            optionButton.frame = CGRectMake(x_offset_button, y_offset, 21, 21);
            [optionButton addTarget:self action:@selector(optionSelected:) forControlEvents: UIControlEventTouchUpInside];
            [questionsBg addSubview:optionButton];
            
            
            y_offset += optionA.bounds.size.height+20;
        }
        questionBGHeight =  y_offset+20;
        questionsBg.contentSize = CGSizeMake(width*0.9, questionBGHeight);

    }
    [self surveyViewed:surveyData.app42CampaignName];
}

-(void)surveyViewed:(NSString*)campName
{
    NSString *eventName = [NSString stringWithFormat:@"CampaignViewed_%@",campName]; //Need to configure the event name
    [[App42IAMManager sharedInstance] executeTrackEventWithName:eventName properties:[NSDictionary dictionary]];
}

-(void)cancelButtonAction:(id)sender
{
    if (self.delegate)
    {
        if (selectedOption!= nil) //For Radio button
        {
            NSString *tagName = [selectedOption titleForState:UIControlStateDisabled];
            NSArray *tagArray = [tagName componentsSeparatedByString:@","];
            [self.delegate updateCancelProps:[NSDictionary dictionaryWithObjectsAndKeys:[tagArray objectAtIndex:0],@"question", nil]];
        }
        else
        {
            NSMutableDictionary *props = [[NSMutableDictionary alloc] initWithCapacity:0];
            NSMutableString *question = nil;
            id option = [optionsArray objectAtIndex:0];
            NSString *tagName = [option titleForState:UIControlStateDisabled];
            NSArray *tagArray = [tagName componentsSeparatedByString:@","];
            question = [tagArray objectAtIndex:0];
            if (question) {
                [props setObject:question forKey:@"question"];
            }
            else
            {
                [props setObject:@"Q1" forKey:@"question"];//Must be changed in case of multiple questions
            }
            [self.delegate updateCancelProps:props];
        }
        
        [self.delegate onCancelAction];
    }
}

-(void)submitButtonAction:(id)sender
{
    if (self.delegate)
    {
        if (selectedOption!= nil) //For Radio button
        {
            NSString *tagName = [selectedOption titleForState:UIControlStateDisabled];
            NSArray *tagArray = [tagName componentsSeparatedByString:@","];
            [self.delegate updateSubmitProps:[NSDictionary dictionaryWithObjectsAndKeys:[tagArray objectAtIndex:0],@"question",[tagArray objectAtIndex:1],@"answers", nil]];
        }
        else //For check box
        {
            NSMutableDictionary *props = [[NSMutableDictionary alloc] initWithCapacity:0];
            NSMutableString *answers = [NSMutableString stringWithString:@""];
            NSMutableString *question = nil;

            for (id option in optionsArray)
            {
                NSString *tagName = [option titleForState:UIControlStateDisabled];
                NSArray *tagArray = [tagName componentsSeparatedByString:@","];
                question = [tagArray objectAtIndex:0];
                if (answers.length)
                {
                    [answers appendFormat:@",%@",[tagArray objectAtIndex:1]];
                }
                else
                {
                    [answers appendString:[tagArray objectAtIndex:1]];
                }
            }
            [props setObject:question forKey:@"question"];
            [props setObject:answers forKey:@"answers"];
            [self.delegate updateSubmitProps:props];
        }
        
        [self.delegate onSubmitAction];
    }
}

-(void)optionSelected:(id)sender
{
    NSString *tagName = [sender titleForState:UIControlStateDisabled];
    NSArray *tagArray = [tagName componentsSeparatedByString:@","];
    NSString *optionType = [tagArray objectAtIndex:2];

    if ([optionType isEqualToString:@"radioButton"])
    {
        if (selectedOption)
        {
            [selectedOption setSelected:NO];
        }
        [sender setSelected:![sender isSelected]];
        selectedOption = sender;
    }
    else
    {
        [sender setSelected:![sender isSelected]];
        if(optionsArray)
        {
            if ([optionsArray containsObject:sender])
            {
                if (![sender isSelected])
                {
                    [optionsArray removeObject:sender];
                }
            }
            else if ([sender isSelected])
            {
                [optionsArray addObject:sender];
            }
        }
        else if ([sender isSelected])
        {
            optionsArray = [NSMutableArray arrayWithObjects:sender, nil];
        }
    }
    submitButton.enabled = YES;
}

@end
