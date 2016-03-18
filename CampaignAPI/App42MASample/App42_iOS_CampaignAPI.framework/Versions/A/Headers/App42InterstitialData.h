//
//  App42InterstitialData.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 14/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "App42CustomDialogueData.h"

@interface App42InterstitialData : App42CustomDialogueData

@property(nonatomic) NSString *cancelBtnImage;



-(instancetype)initWithInterstitialData:(NSDictionary*)interstitialData;
@end
