//
//  ASLogEventLevel.h
//  AppSpectorSDK
//
//  Created by Deszip on 05/06/2018.
//  Copyright © 2018 Techery. All rights reserved.
//

#ifndef ASLogEventLevel_h
#define ASLogEventLevel_h

typedef NS_ENUM(NSUInteger, ASLogEventLevel) {
    ASLogEventLevelUndefined = 0,
    ASLogEventLevelOff,
    
    ASLogEventLevelVerbose,
    ASLogEventLevelDebug,
    ASLogEventLevelInfo,
    ASLogEventLevelWarn,
    ASLogEventLevelError,
    ASLogEventLevelAssert,
    
    ASLogEventLevelDefault = ASLogEventLevelVerbose
};

#endif /* ASLogEventLevel_h */
