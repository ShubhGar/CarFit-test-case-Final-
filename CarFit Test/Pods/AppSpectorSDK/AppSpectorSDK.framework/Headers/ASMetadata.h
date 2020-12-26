//
//  ASMetadata.h
//  AppSpectorSDK
//
//  Created by Deszip on 17/05/2019.
//  Copyright © 2019 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef ASMetadata_h
#define ASMetadata_h

// Metadata keys, any non-listed below keys are ignored, max value length is 1KB
NS_SWIFT_NAME(MetadataKey) typedef NSString ASMetadataKey NS_TYPED_EXTENSIBLE_ENUM;
NS_SWIFT_NAME(Metadata) typedef NSDictionary <ASMetadataKey *, NSString *> ASMetadata;

// Value that will be used as a device name in sessions list
NS_SWIFT_NAME(DeviceNameKey) extern ASMetadataKey * const AS_DEVICE_NAME_KEY;


#endif /* ASMetadata_h */
