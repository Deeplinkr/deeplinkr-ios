//
//  Deeplinkr.h
//  Deeplinkr
//
//  Created by Sean McGary on 7/5/14.
//  Copyright (c) 2014 Deeplinkr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface Deeplinkr : NSObject

@property (strong, nonatomic) NSString *apiToken;
@property (strong, nonatomic) NSString *appId;
@property (strong, nonatomic) NSString *appVersion;

+(id) sharedManager;
-(void) setApiToken: (NSString *) token;
-(void) logVisit: (NSString *) clickUUID;

@end
