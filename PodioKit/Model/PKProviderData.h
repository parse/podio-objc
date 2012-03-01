//
//  PKProviderData.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 3/1/12.
//  Copyright (c) 2012 Podio. All rights reserved.
//

#import "PKObjectData.h"

@interface PKProviderData : PKObjectData

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;

@end
