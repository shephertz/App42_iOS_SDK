//
//  App42Alert.m
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 06/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42Alert.h"
#import <UIKit/UIKit.h>

@implementation App42Alert


+(void)showAlertWithInfo:(App42AlertData*)alertData delegate:(id)delegate
{    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertData.title message:alertData.message delegate:delegate cancelButtonTitle:alertData.submitBtnTitle otherButtonTitles:alertData.cancelBtnTitle, nil];
    alertView.backgroundColor = [UIColor redColor];
    alertView.frame = [[UIScreen mainScreen] bounds];
    [alertView show];
}


@end
