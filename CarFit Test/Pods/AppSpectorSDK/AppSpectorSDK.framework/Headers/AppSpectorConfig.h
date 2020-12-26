//
//  AppSpectorConfig.h
//  AppSpectorSDK
//
//  Created by Techery on 12/09/2017.
//  Copyright © 2017 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASMetadata.h"
#import "ASHTTPMonitorSanitizer.h"
#import "ASLogSanitizer.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Monitor) typedef NSString *ASMonitorID NS_TYPED_EXTENSIBLE_ENUM;

// Monitor IDs
NS_SWIFT_NAME(screenshot)       extern ASMonitorID const AS_SCREENSHOT_MONITOR;
NS_SWIFT_NAME(sqlite)           extern ASMonitorID const AS_SQLITE_MONITOR;
NS_SWIFT_NAME(http)             extern ASMonitorID const AS_HTTP_MONITOR;
NS_SWIFT_NAME(coredata)         extern ASMonitorID const AS_COREDATA_MONITOR;
NS_SWIFT_NAME(performance)      extern ASMonitorID const AS_PERFORMANCE_MONITOR;
NS_SWIFT_NAME(logs)             extern ASMonitorID const AS_LOG_MONITOR;
NS_SWIFT_NAME(location)         extern ASMonitorID const AS_LOCATION_MONITOR;
NS_SWIFT_NAME(environment)      extern ASMonitorID const AS_ENVIRONMENT_MONITOR;
NS_SWIFT_NAME(notifications)    extern ASMonitorID const AS_NOTIFICATION_MONITOR;
NS_SWIFT_NAME(analytics)        extern ASMonitorID const AS_ANALYTICS_MONITOR;
NS_SWIFT_NAME(userdefaults)     extern ASMonitorID const AS_DEFAULTS_MONITOR;
NS_SWIFT_NAME(commands)         extern ASMonitorID const AS_COMMANDS_MONITOR;
NS_SWIFT_NAME(customEvents)     extern ASMonitorID const AS_CUSTOMEVENTS_MONITOR;
NS_SWIFT_NAME(fileSystem)       extern ASMonitorID const AS_FS_MONITOR;


@interface AppSpectorConfig : NSObject

/**
 Key to bind your debugging session to application on the backend.
 Get one in app settings on https://app.appspector.com/
 */
@property (copy, nonatomic, readonly) NSString *apiKey;

/**
 Public key to connect to encrypted sessions.
 */
@property (copy, nonatomic, readonly) NSData *publicKey;

/**
 Custom values that will be passed to the backend. See `ASMetadataKey`.
 */
@property (copy, nonatomic) ASMetadata *metadata;


/**
 Called after SDK opens connection to backend and starts sending data.
 Session URL is passed as an argument and will remain valid after session ends.
 */
typedef void (^ASStartCallback)(NSURL *sessionURL);
@property (copy, nonatomic) ASStartCallback startCallback;


/**
 Monitor sanitizers
 Should be configured before call to '[AppSpector start]' method to take effect.
 */
@property (strong, nonatomic, readonly) ASHTTPMonitorSanitizer *httpSanitizer;
@property (strong, nonatomic, readonly) ASLogSanitizer *logSanitizer;

/**
 Builds config with all monitors enabled.
 
 @param apiKey NSString key used to access application instance. You can get one on settings page after creating app on the frontend.
 
 @return AppSpectorConfig
 */
+ (instancetype)configWithAPIKey:(NSString *)apiKey;

/**
 @param apiKey NSString key used to access application instance. You can get one on settings page after creating app on the frontend.
 @param monitorIDs NSSet <NSString *> list of monitor IDs to load. Use `AS_ALL_MONITORS` macro to enable all provided monitors.
 
 @return AppSpectorConfig
 */
+ (instancetype)configWithAPIKey:(NSString *)apiKey
                      monitorIDs:(NSSet <ASMonitorID> *)monitorIDs;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
