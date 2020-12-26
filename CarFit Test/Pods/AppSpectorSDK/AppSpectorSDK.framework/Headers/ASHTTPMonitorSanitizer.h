
//  ASHTTPMonitorSanitizer.h
//  AppSpectorSDK
//
//  Created by Deszip on 30/03/2018.
//  Copyright © 2018 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASHTTPEvent.h"

NS_ASSUME_NONNULL_BEGIN

typedef  ASHTTPEvent * _Nullable (^ASHTTPFilter)(ASHTTPEvent *event);

@interface ASHTTPMonitorSanitizer : NSObject

@property (copy, nonatomic) ASHTTPFilter filter;

@end

NS_ASSUME_NONNULL_END
