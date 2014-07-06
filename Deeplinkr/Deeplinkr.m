//
//  Deeplinkr.m
//  Deeplinkr
//
//  Created by Sean McGary on 7/5/14.
//  Copyright (c) 2014 Deeplinkr. All rights reserved.
//
#define TOKEN_HEADER @"X-DEEPLINKR-TOKEN"
#define API_ROUTE @"/api/trackClick"

#ifdef DEBUG
#define API_HOST @"http://dev.deeplinkr.com"
#else
#define API_HOST @"https://deeplinkr.com"
#endif


#import "Deeplinkr.h"

@implementation Deeplinkr


#pragma mark Singleton Methods

+(id) sharedManager {
    __strong static Deeplinkr *deeplinkr = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        deeplinkr = [[self alloc] init];
    });
    return deeplinkr;
}

-(id) init {
    self = [super init];
    if(self){
        _appId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
        _appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        
    }
    return self;
}

-(void) setApiToken:(NSString *)token {
    _apiToken = token;
}

-(void) logVisit: (NSString *) clickUUID {
    
    if(!clickUUID || ![clickUUID length]){
        NSLog(@"No clickUUID provided");
        return;
    }
    
    if(!_apiToken){
        NSLog(@"token required to continue");
        return;
    }
    
    NSDictionary *jsonData = @{
        @"clickUUID": clickUUID,
        @"appId": _appId,
        @"appVersion": _appVersion,
        @"platform": @"ios"
    };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // set the api token
    [manager.requestSerializer setValue:_apiToken forHTTPHeaderField:TOKEN_HEADER];
    NSString *apiRoute = [NSString stringWithFormat:@"%@%@", API_HOST, API_ROUTE];
    NSLog(@"%@", apiRoute);
    NSLog(@"%@", jsonData);
    [manager
        POST:apiRoute
        parameters:jsonData
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
            // success
            NSLog(@"Success");
            NSLog(@"%@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            // error
            NSLog(@"Error");
            NSLog(@"%@", error);
        }
    ];
}

@end
