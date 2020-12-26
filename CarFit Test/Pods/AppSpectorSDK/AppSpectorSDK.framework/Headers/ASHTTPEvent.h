//
//  ASHTTPEvent.h
//  AppSpectorSDK
//
//  Created by Deszip on 31/05/2018.
//  Copyright © 2018 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Event representing HTTP request tracked by HTTP monitor.
 'request' / 'response' properties could be modified to adjust what data will be sent to the frontend.
 'blocked' flag discards request tracking when set to true. Default value is false.
 */
@interface ASHTTPEvent : NSObject

@property (assign, nonatomic) BOOL blocked;
@property (strong, nonatomic, nullable) NSMutableURLRequest *request;
@property (strong, nonatomic, nullable) NSURLResponse *response;

+ (instancetype)eventWithRequest:(NSURLRequest *)request;
+ (instancetype)eventWithResponse:(NSURLResponse *)response;

@end

NS_ASSUME_NONNULL_END
