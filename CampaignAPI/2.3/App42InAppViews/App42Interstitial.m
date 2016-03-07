//
//  App42Interstitial.m
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 07/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42Interstitial.h"

@interface App42Interstitial ()
{
    UIButton *cancelButton;
}
@end

@implementation App42Interstitial


-(void)buildInterstitial:(App42InterstitialData*)interstitialData
{
    /***
     * Creating Submit Button
     */
    UIImage *image = [UIImage imageNamed:interstitialData.cancelBtnImage];
    cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:image forState:UIControlStateNormal];
    [cancelButton sizeToFit];
    [cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    CGSize contentSize = self.bounds.size;
    cancelButton.center = CGPointMake(contentSize.width-cancelButton.bounds.size.width/2, cancelButton.bounds.size.height/2);
    [self addSubview:cancelButton];
    
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [self addGestureRecognizer:singleTap];
}



-(void)cancelButtonAction:(id)sender
{
    if (self.delegate)
    {
        [self.delegate onCancelAction];
    }
}


#pragma mark - Gesture Recognizer delegate

// This method receive touch event first
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    CGPoint touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(cancelButton.frame, touchPoint))
    {
        //NSLog(@"Close button tapped");
    }
    else
    {
        if (self.delegate)
        {
            [self.delegate onSubmitAction];
        }
    }
    return NO;
}

@end
