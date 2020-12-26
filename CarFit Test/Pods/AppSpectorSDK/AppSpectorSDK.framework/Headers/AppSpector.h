//
//  AppSpector.h
//  AppSpectorSDK
//
//  Created by Techery on 5/18/17.
//  Copyright © 2017 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppSpectorConfig.h"
#import "ASExternalEvent.h"
#import "ASAppSpectorLogger.h"
#import "ASCustomEventPayload.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppSpector : NSObject

/// Starts AppSpector using provided config.
/// First loads and starts configured monitors then establishes session with backend using provided key.
/// Does nothing if AppStore environment detected.
/// @param config AppSpetorConfig instance providing API key, list of monitors to load and metadata.
+ (void)runWithConfig:(AppSpectorConfig *)config;


/// API to manually start and stop SDK
+ (void)start;
+ (void)stop;

/// Current SDK state. `YES` means SDK either working and session is online or in a process of starting it.
+ (BOOL)isRunning;

/// API for external events, used by Flutter plugin and some other integrations.
/// If you believe you need this - fell free to contact AppSpector guys for help: mailto:info@appspector.com.
/// @param event ASExternalEvent event model to be passed to SDK monitors
+ (void)sendEvent:(ASExternalEvent *)event;

/// API for custom events monitor.
/// Will raise exception if custom events monitor is not enabled.
/// @param payload id <ASCustomEventPayload> payload model to be passed to custom events monitor
+ (void)sendCustomEventWith:(id <ASCustomEventPayload>)payload;

/// Updates metadata associated with current session. Overwrites metadata.
/// @param metadata ASMetadata
+ (void)updateMetadata:(ASMetadata *)metadata;

/// Updates metadata value. If key was not found - adds it with a passed value.
/// @param value id
/// @param key ASMetadataKey. Only supported key for now is `AS_DEVICE_NAME_KEY` which overwrites device name in sessions list.
+ (void)updateMetadataValue:(id)value forKey:(ASMetadataKey *)key;

@end

NS_ASSUME_NONNULL_END
