//
//  ASAppSpectorLogger.h
//  AppSpectorSDK
//
//  Created by Deszip on 08/05/2019.
//  Copyright © 2019 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASLogEventLevel.h"

void APSLog(ASLogEventLevel level, NSString *tag, NSString *message, ...) NS_SWIFT_UNAVAILABLE("C functions that use the ... syntax for variadic arguments are unavailable.");

@interface ASAppSpectorLogger : NSObject

+ (void)logMessage:(NSString *)message tag:(NSString *)tag level:(ASLogEventLevel)level;

@end
