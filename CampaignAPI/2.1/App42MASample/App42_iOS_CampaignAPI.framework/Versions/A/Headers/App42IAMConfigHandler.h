//
//  App42IAMConfigHandler.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 06/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App42IAMConfigHandler : NSObject

+(void)saveConfigToCache:(NSDictionary*)config;
+(void)saveConfigToDesktop:(NSDictionary *)config;
+(NSDictionary*)getConfigFromCache;


//Temporary method :: Remove b4 release
+(NSDictionary*)getConfigFromResource;

+(NSString*)app42ImageFolderPath;
@end
