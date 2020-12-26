//
//  ASCustomEventPayload.h
//  AppSpectorSDK
//
//  Created by Yevhen Sichkar on 28.02.2020.
//  Copyright © 2020 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ASCustomEventPayload <NSObject>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSDictionary *payload;

@end
