//
//  ResponseViewController.h
//  PAE_iOS_SDK
//
//  Created by Shephertz Technologies Pvt Ltd on 22/10/14.
//  Copyright (c) 2014 ShephertzTechnology PVT LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResponseViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextView *responseView;
@property(nonatomic,retain) NSString *response;
@end
