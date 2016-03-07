//
//  App42PopUp.m
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 07/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42PopUp.h"

@implementation App42PopUp

-(void)buildPopUpFromData:(App42PopUpData*)popUpData
{
    /***
     * Setting view attributes
     */
    self.backgroundColor = [UIColor grayColor];
    
    /***
     * Creating title
     */
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    titleLabel.text = popUpData.title;
    //titleLabel.textColor = popUpData.titleColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    titleLabel.center = CGPointMake(popUpData.popUpWidth/2, titleLabel.bounds.size.height/2+5);
    [self addSubview:titleLabel];
    
    /***
     * Creating message
     */
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    messageLabel.text = popUpData.message;
    //titleLabel.textColor = popUpData.titleColor;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    [messageLabel sizeToFit];
    messageLabel.center = CGPointMake(popUpData.popUpWidth/2, popUpData.popUpHeight/2);
    [self addSubview:messageLabel];

    /***
     * Creating Submit Button
     */
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //okButton.backgroundColor = popUpData.btnBackgroundColor;
    [okButton setTitle:popUpData.submitBtnTitle forState:UIControlStateNormal];
    [okButton setContentEdgeInsets:UIEdgeInsetsMake(2, 6, 2, 6)];
    [okButton sizeToFit];
    [okButton addTarget:self action:@selector(okButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    okButton.center = CGPointMake(3*popUpData.popUpWidth/4, popUpData.popUpHeight-okButton.bounds.size.height/2);
    [self addSubview:okButton];
    
    /***
     * Creating Cancel Button
     */
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //cancelButton.backgroundColor = popUpData.btnBackgroundColor;
    [cancelButton setTitle:popUpData.cancelBtnTitle forState:UIControlStateNormal];
    [cancelButton setContentEdgeInsets:UIEdgeInsetsMake(2, 6, 2, 6)];
    [cancelButton sizeToFit];
    [cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.center = CGPointMake(popUpData.popUpWidth/4, popUpData.popUpHeight-cancelButton.bounds.size.height/2);
    [self addSubview:cancelButton];
}

-(void)okButtonAction:(id)sender
{
    if (self.delegate)
    {
        [self.delegate onSubmitAction];
    }
}

-(void)cancelButtonAction:(id)sender
{
    if (self.delegate)
    {
        [self.delegate onCancelAction];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
