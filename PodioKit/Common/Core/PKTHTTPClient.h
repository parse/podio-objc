//
//  PKTClient.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 16/01/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTRequest.h"
#import "PKTResponse.h"
#import "PKTRequestSerializer.h"
#import "PKTResponseSerializer.h"

typedef void(^PKTRequestCompletionBlock)(PKTResponse *response, NSError *error);

@interface PKTHTTPClient : NSObject

@property (nonatomic, copy, readonly) NSURL *baseURL;
@property (nonatomic, strong, readonly) PKTRequestSerializer *requestSerializer;
@property (nonatomic, strong, readonly) PKTResponseSerializer *responseSerializer;

/**
 *  Controls whether or not to pin the server public key to that of any .cer certificate included in the app bundle.
 */
@property (nonatomic) BOOL useSSLPinning;

- (NSURLSessionTask *)taskForRequest:(PKTRequest *)request completion:(PKTRequestCompletionBlock)completion;

@end
