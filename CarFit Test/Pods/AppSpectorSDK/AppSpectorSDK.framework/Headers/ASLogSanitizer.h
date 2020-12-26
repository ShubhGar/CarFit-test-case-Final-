//
//  ASLogSanitizer.h
//  AppSpectorSDK
//
//  Created by Deszip on 04/06/2018.
//  Copyright © 2018 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASLogMonitorEvent.h"

NS_ASSUME_NONNULL_BEGIN

typedef ASLogMonitorEvent * _Nullable (^ASLogFilter)(ASLogMonitorEvent *event);

@interface ASLogSanitizer : NSObject

@property (copy, nonatomic) ASLogFilter filter;

@end

NS_ASSUME_NONNULL_END
