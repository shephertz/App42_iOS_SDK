//
//  App42CustomView.m
//  App42CampaignAPISample
//
//  Created by Rajeev Ranjan on 19/02/16.
//  Copyright © 2016 Rajeev Ranjan. All rights reserved.
//

#import "App42CustomView.h"

@interface App42CustomView ()
{
    App42IAMLayoutType layoutType;
    App42IAMLayoutGravity layoutGravity;
}

@end

@implementation App42CustomView

-(void)buildCustomViewFromData:(App42CustomViewData*)customViewData
{
    layoutType = [customViewData getLayputType];
    //layoutType = kApp42_LeftImage;
    layoutGravity = [customViewData getGravity];
    
    //layoutType = kApp42_RightImage;
    //layoutType = kApp42_NoImage;
    /***
     * Setting view attributes
     */
    
    
    APP42Log(@"customViewData.backColor: %@",customViewData.backColor);
    self.backgroundColor = [self getUIColorObjectFromHexString:customViewData.backColor alpha:1.0f];
    
//    [UIColor clearColor];
    CGSize viewSize = self.frame.size;
    float x_pos = 0;
//    float x_pos_icon = 0;
    float y_pos_icon = 0;
    float y_pos_texts = 0;
    float y_pos_texts_offset = 0;
    
    
    
    /***
     * Creating Cancel Button
     */
    UIButton *cancelButton;
    if([customViewData getLayoutCancellationType]==kApp42_Manual)
    {
        UIImage *image = [UIImage imageNamed:customViewData.cancelBtnImage];
        cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelButton setImage:image forState:UIControlStateNormal];
        [cancelButton setContentEdgeInsets:UIEdgeInsetsMake(4, 4, 4, 4)];
        [cancelButton sizeToFit];
        [cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        cancelButton.center = CGPointMake(15.0, 15.0);
    }
    else
    {
        [self automateViewLife:customViewData];
    }
    
    
    
    /**
     * Creating background
     */
    UIImage *bgImage = [UIImage imageNamed: customViewData.backgroundImage];
    //UIImage *bgImage = [UIImage imageNamed:@"BgImage.png"];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    bgImageView.userInteractionEnabled = YES;
    bgImageView.frame = CGRectMake(0, 0, viewSize.width, viewSize.height);
    [self addSubview:bgImageView];
    
    /**
     * Creating Icon
     */
    UIImageView *icon = nil;
    if (layoutType!=kApp42_NoImage) {
        UIImage *iconImage = [UIImage imageNamed: customViewData.iconImage];
        //UIImage *iconImage = [UIImage imageNamed:@"Icon.png"];
        icon = [[UIImageView alloc] initWithImage:iconImage];
        icon.userInteractionEnabled = YES;
        y_pos_icon = 25;
        int scale = 2;
        if (layoutGravity != kApp42_Center) {
            scale = 5;
        }
        icon.frame = CGRectMake(0, y_pos_icon, iconImage.size.width/scale, iconImage.size.height/scale);
        y_pos_texts_offset = icon.frame.size.height+y_pos_icon;
        [self fixIconPosition:icon];
        [self addSubview:icon];
    }
    
    
    /***
     * Creating title
     */
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewSize.width - icon.frame.size.width - 20, 0)];
    titleLabel.text = [customViewData.customTitle objectForKey:APP42IAM_TEXT];
    titleLabel.textColor = [self getUIColorObjectFromHexString:[customViewData.customTitle objectForKey:APP42IAM_COLOR] alpha:1.0f];
    titleLabel.font = [UIFont fontWithName:[customViewData.customTitle objectForKey:APP42IAM_STYLE] size:[[customViewData.customTitle objectForKey:APP42IAM_SIZE] intValue]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    [titleLabel sizeToFit];
    x_pos = icon.frame.size.width+(viewSize.width-icon.frame.size.width)/2;
    y_pos_texts = viewSize.height/5;
    titleLabel.center = CGPointMake(x_pos, y_pos_texts + 20);
    [self fixTitlePosition:titleLabel withReferenceToIcon:icon];
    [self addSubview:titleLabel];
//    [titleLabel setBackgroundColor:[UIColor greenColor]];
    
    if (layoutType == kApp42_NoImage){
        CGRect titleRect = titleLabel.frame;
        titleRect.origin.y = cancelButton.frame.origin.y + cancelButton.frame.size.height + 5;
        titleLabel.frame = titleRect;
    }
    
    if (layoutType==kApp42_LeftImage || layoutType==kApp42_RightImage){
    
        y_pos_texts += titleLabel.frame.size.height/2;

        CGRect titleRect = titleLabel.frame;
        titleRect.origin.y = cancelButton.frame.origin.y + cancelButton.frame.size.height + 5;
        titleLabel.frame = titleRect;
    }
    else if (layoutType==kApp42_CenterImage || layoutGravity!= kApp42_Center){
        y_pos_texts = titleLabel.center.y+titleLabel.frame.size.height/2;
        y_pos_texts_offset = 0;
    }
    else
        y_pos_texts += titleLabel.frame.size.height/2;
    
    
    /***
     * Creating message1
     */
    UILabel *messageLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0, viewSize.width - 20.0, 0)];
    messageLabel1.text = [customViewData.message1 objectForKey:APP42IAM_TEXT];
    messageLabel1.textColor = [self getUIColorObjectFromHexString:[customViewData.message1 objectForKey:APP42IAM_COLOR] alpha:1.0f];
    messageLabel1.font = [UIFont fontWithName:[customViewData.message1 objectForKey:APP42IAM_STYLE] size:[[customViewData.message1 objectForKey:APP42IAM_SIZE] intValue]];
    messageLabel1.textAlignment = NSTextAlignmentCenter;
    messageLabel1.numberOfLines = 0;
    [messageLabel1 sizeToFit];
    
    y_pos_texts = ((y_pos_texts_offset>y_pos_texts)? y_pos_texts_offset:y_pos_texts) + messageLabel1.frame.size.height / 2 + 10;
    
    if (layoutGravity!= kApp42_Center)
    {
        if (layoutType == kApp42_LeftImage)
            messageLabel1.textAlignment = NSTextAlignmentRight;
        else{
            messageLabel1.textAlignment = NSTextAlignmentLeft;
        }
        
        APP42Log(@"titleLabel.center.x: %f", titleLabel.center.x);
        
        messageLabel1.center = CGPointMake(titleLabel.center.x, y_pos_texts);
    }
    else
    {
        messageLabel1.center = CGPointMake(viewSize.width/2, y_pos_texts);
    }
    
    [self fixMessage1Position:messageLabel1 withReferenceToIcon:icon];
    [self addSubview:messageLabel1];
    
    y_pos_texts += messageLabel1.frame.size.height/2;
    
    
    CGRect backViewRect = self.frame;

    UILabel *messageLabel3;
    if (layoutGravity == kApp42_Center){
        /***
         * Creating message2
         */
        UILabel *messageLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, 0)];
        messageLabel2.text = [customViewData.message2 objectForKey:APP42IAM_TEXT];
        messageLabel2.textColor = [self getUIColorObjectFromHexString:[customViewData.message2 objectForKey:APP42IAM_COLOR] alpha:1.0f];
        messageLabel2.font = [UIFont fontWithName:[customViewData.message2 objectForKey:APP42IAM_STYLE] size:[[customViewData.message2 objectForKey:APP42IAM_SIZE] intValue]];
        messageLabel2.textAlignment = NSTextAlignmentCenter;
        messageLabel2.numberOfLines = 0;
        [messageLabel2 sizeToFit];
        y_pos_texts += messageLabel2.frame.size.height/2+10;
        messageLabel2.center = CGPointMake(viewSize.width/2, y_pos_texts);
        [self addSubview:messageLabel2];
        y_pos_texts += messageLabel1.frame.size.height/2;
        
        /***
         * Creating message3
         */
        messageLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, 0)];
        messageLabel3.text = [customViewData.message3 objectForKey:APP42IAM_TEXT];
        messageLabel3.textColor = [self getUIColorObjectFromHexString:[customViewData.message3 objectForKey:APP42IAM_COLOR] alpha:1.0f];
        messageLabel3.font = [UIFont fontWithName:[customViewData.message3 objectForKey:APP42IAM_STYLE] size:[[customViewData.message3 objectForKey:APP42IAM_SIZE] intValue]];
        messageLabel3.textAlignment = NSTextAlignmentCenter;
        messageLabel3.numberOfLines = 0;
        [messageLabel3 sizeToFit];
        y_pos_texts += messageLabel3.frame.size.height/2+10;
        messageLabel3.center = CGPointMake(viewSize.width/2, y_pos_texts);
        [self addSubview:messageLabel3];

        
        backViewRect.size.height = messageLabel3.frame.origin.y + messageLabel3.frame.size.height + 5.0;

    }
    else{
        backViewRect.size.height = messageLabel1.frame.origin.y + messageLabel1.frame.size.height + 5.0;
    }
    
    [self addSubview:cancelButton];

    
    
    self.frame = backViewRect;

    bgImageView.frame = self.frame;
    
    
    bgImageView.frame = CGRectMake(0, 0, self.frame.size.width , self.frame.size.height);
    
    /***
     * Creating Submit Button
     */
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    okButton.backgroundColor = [UIColor clearColor];// customViewData.btnBackgroundColor;
    //    [okButton setTitle:customViewData.submitBtnTitle forState:UIControlStateNormal];
    //    [okButton setContentEdgeInsets:UIEdgeInsetsMake(2, 6, 2, 6)];
    //    [okButton sizeToFit];
    [okButton addTarget:self action:@selector(okButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //    okButton.center = CGPointMake(3*customViewData.popUpWidth/4, customViewData.popUpHeight-okButton.bounds.size.height/2);
    okButton.frame = CGRectMake(0.0, cancelButton.frame.origin.y + cancelButton.frame.size.height + 5.0, self.frame.size.width, self.frame.size.height - (cancelButton.frame.origin.y + cancelButton.frame.size.height + 15.0));
    [self addSubview:okButton];
    
    
    
    if(customViewData.roundedCorner){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 7.0f;
    }
    
}


-(void)fixIconPosition:(UIImageView *)imageView
{
    CGSize viewSize = self.frame.size;
    
    if (layoutType == kApp42_LeftImage) {
        imageView.center = CGPointMake(imageView.frame.size.width/2+15, imageView.center.y);
    }
    else if (layoutType == kApp42_RightImage) {
         imageView.center = CGPointMake(viewSize.width-imageView.frame.size.width/2-10, imageView.center.y);
    }
    else if (layoutType == kApp42_CenterImage) {
        imageView.center = CGPointMake(viewSize.width/2, imageView.center.y);
    }
    else
    {
        //No Image
    }
}

-(void)fixTitlePosition:(UILabel *)title withReferenceToIcon:(UIImageView *)imageView
{
    CGSize viewSize = self.frame.size;
    
    if (layoutType == kApp42_LeftImage) {
        //Already right aligned
//         title.center = CGPointMake(imageView.center.x + 5, title.center.y);
        

        if (layoutGravity == kApp42_Center){
            title.textAlignment = NSTextAlignmentLeft;
            CGRect titleFrame = title.frame;
            titleFrame.origin.x = (imageView.frame.size.width + imageView.frame.origin.x + 10);
            title.frame = titleFrame;
        }
        else{
            title.textAlignment = NSTextAlignmentRight;

            title.center = CGPointMake(self.frame.size.width - (title.frame.size.width / 2) - 10, title.center.y);
        }
    }
    else if (layoutType == kApp42_RightImage) {
        
        if (layoutGravity == kApp42_Center)
            title.textAlignment = NSTextAlignmentLeft;
        else
            title.textAlignment = NSTextAlignmentLeft;
        
        title.center = CGPointMake(title.frame.size.width/2 + 15, title.center.y);
    }
    else if (layoutType == kApp42_CenterImage) {
        title.center = CGPointMake(viewSize.width/2, imageView.center.y+imageView.frame.size.height/2+title.frame.size.height/2+10);
    }
    else
    {
        //No Image
        title.center = CGPointMake(title.center.x, 20);
    }
}

-(void)fixMessage1Position:(UILabel *)message1 withReferenceToIcon:(UIImageView *)imageView
{
    CGSize viewSize = self.frame.size;
    
    if (layoutType == kApp42_LeftImage) {
        //Already right aligned
        //title.center = CGPointMake(title.frame.size.width/2, title.center.y);
        message1.center = CGPointMake(viewSize.width - (message1.frame.size.width / 2) - 10, message1.center.y);
    }
    else if (layoutType == kApp42_RightImage) {
        
//        APP42Log(@"message1: %f", message1.center.x);
//        message1.center = CGPointMake( message1.center.x + 10, message1.center.y);
        message1.center = CGPointMake(message1.frame.size.width/2 + 15, message1.center.y);
    }
    else if (layoutType == kApp42_CenterImage) {
        message1.center = CGPointMake(viewSize.width/2, message1.center.y);
    }
    else
    {
        //No Image
    }
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


- (UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha
{
    // Convert hex string to an integer
    unsigned int hexint = [self intFromHexString:hexStr];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}

- (unsigned int)intFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}

-(void)automateViewLife:(App42CustomViewData*)customViewData
{
    customViewData.autoTimeOut = 3;
    [self performSelector:@selector(cancelButtonAction:) withObject:self afterDelay:customViewData.autoTimeOut];
}

@end
