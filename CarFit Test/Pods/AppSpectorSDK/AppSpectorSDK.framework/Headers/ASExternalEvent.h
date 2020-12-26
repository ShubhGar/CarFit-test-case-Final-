//
//  ASExternalEvent.h
//  AppSpectorSDK
//
//  Created by Deszip on 08/04/2019.
//  Copyright © 2019 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASExternalEvent : NSObject

@property (copy, nonatomic, readonly) NSString *monitorID;
@property (copy, nonatomic, readonly) NSString *eventID;
@property (strong, nonatomic, readonly) NSDictionary *payload;

- (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithMonitorID:(NSString *)monitorID eventID:(NSString *)eventID payload:(NSDictionary *)payload NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
