//
//  App42API.h
//  PAE_iOS_SDK
//
//  Created by shephertz technologies on 20/06/13.
//  Copyright (c) 2013 ShephertzTechnology PVT LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App42API : NSObject
{

}

+(NSArray*) getDefaultACL;
+(void) setDefaultACL:(NSArray*)l_defaultACL;
+(NSString*) getLoggedInUser;
+(void) setLoggedInUser:(NSString*)l_loggedInUser;
+(NSString*) getUserSessionId;
+(void) setUserSessionId:(NSString*)l_userSessionId;
+(void)initializeWithAPIKey:(NSString*)l_apiKey andSecretKey:(NSString*)l_secretKey;
+(void) setFbAccesToken:(NSString*)l_fbAccesToken;
+(NSString*) getFbAccesToken;
+(void) setInstallId:(NSString*)l_installId;
+(NSString*) getInstallId;
+(void)removeSession;

+(void)enableAppStateEventTracking:(BOOL)isEnable;
+(void)enableEventService:(BOOL)isEnable;
+(void)enableAppAliveTracking:(BOOL)isEnable;

+(void)setBaseUrl:(NSString*)baseUrl;
+(void)setEventBaseUrl:(NSString*)baseUrl;

+(void)setCacheStoragePolicy:(NSURLRequestCachePolicy)cachePolicy;
+(NSURLRequestCachePolicy)getCacheStoragePolicy;

+(void)enableApp42Trace:(BOOL)isEnable;
+(void)enableCrashEventHandler:(BOOL)isEnable;
+(NSString*) getDbName;
+(void) setDbName:(NSString*) l_dbName;

+(NSString*)getSecretKey;
+(void)setOfflineStorage:(BOOL)_offlineStorage;
+(void)setOfflineStorage:(BOOL)_offlineStorage withCacheSize:(long)cacheSize;
+(BOOL)getOfflineStorage;


+(id)buildPushService;
/*!
 *@return Returns the instance of EventService API
 */
+(id)buildEventService;

@end
