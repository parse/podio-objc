//
//  PKTStatus.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 30/06/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTStatus.h"
#import "PKTByLine.h"
#import "PKTComment.h"
#import "PKTStatusAPI.h"
#import "PKTClient.h"
#import "NSValueTransformer+PKTTransformers.h"

typedef void (^PKTStatusCompletionBlock)(PKTStatus *status, NSError *error);

@implementation PKTStatus

#pragma mark - PKTModel

+ (NSDictionary *)dictionaryKeyPathsForPropertyNames {
  return @{
           @"statusID" : @"status_id",
           @"text" : @"value",
           @"createdBy" : @"created_by",
           @"createdOn" : @"created_on",
           };
}

+ (NSValueTransformer *)linkValueTransformer {
  return [NSValueTransformer pkt_URLTransformer];
}

+ (NSValueTransformer *)createdOnValueTransformer {
  return [NSValueTransformer pkt_dateValueTransformer];
}

+ (NSValueTransformer *)createdByValueTransformer {
  return [NSValueTransformer pkt_transformerWithModelClass:[PKTByLine class]];
}

+ (NSValueTransformer *)commentsValueTransformer {
  return [NSValueTransformer pkt_transformerWithModelClass:[PKTComment class]];
}

#pragma mark - Public

+ (PKTRequestCompletionBlock)requestCompletionBlockForCompletionBlock:(PKTStatusCompletionBlock)completion {
  Class klass = [self class];
  return ^(PKTResponse *response, NSError *error) {
    PKTStatus *status = nil;
    if (!error) {
      status = [[klass alloc] initWithDictionary:response.body];
    }
    
    completion(status, error);
  };
}

+ (PKTRequestTaskHandle *)fetchWithID:(NSUInteger)statusID completion:(void (^)(PKTStatus *status, NSError *error))completion {
  NSParameterAssert(completion);
  
  PKTRequest *request = [PKTStatusAPI requestForStatusMessageWithID:statusID];
  PKTRequestTaskHandle *handle = [[PKTClient currentClient] performRequest:request completion:[self requestCompletionBlockForCompletionBlock:completion]];

  return handle;
}

+ (PKTRequestTaskHandle *)addNewStatusMessageWithText:(NSString *)text spaceID:(NSUInteger)spaceID completion:(void (^)(PKTStatus *status, NSError *error))completion {
  PKTRequest *request = [PKTStatusAPI requestToAddNewStatusMessageWithText:text spaceID:spaceID];
  PKTRequestTaskHandle *handle = [[PKTClient currentClient] performRequest:request completion:[self requestCompletionBlockForCompletionBlock:completion]];

  return handle;
}

+ (PKTRequestTaskHandle *)addNewStatusMessageWithText:(NSString *)text spaceID:(NSUInteger)spaceID files:(NSArray *)files completion:(void (^)(PKTStatus *status, NSError *error))completion {
  NSArray *fileIDs = [files valueForKey:@"fileID"];
  PKTRequest *request = [PKTStatusAPI requestToAddNewStatusMessageWithText:text spaceID:spaceID files:fileIDs];
  
  PKTRequestTaskHandle *handle = [[PKTClient currentClient] performRequest:request completion:[self requestCompletionBlockForCompletionBlock:completion]];

  return handle;
}

+ (PKTRequestTaskHandle *)addNewStatusMessageWithText:(NSString *)text spaceID:(NSUInteger)spaceID files:(NSArray *)files embedID:(NSUInteger)embedID completion:(void (^)(PKTStatus *status, NSError *error))completion {
  NSArray *fileIDs = [files valueForKey:@"fileID"];
  PKTRequest *request = [PKTStatusAPI requestToAddNewStatusMessageWithText:text spaceID:spaceID files:fileIDs embedID:embedID];
  
  PKTRequestTaskHandle *handle = [[PKTClient currentClient] performRequest:request completion:[self requestCompletionBlockForCompletionBlock:completion]];

  return handle;
}

+ (PKTRequestTaskHandle *)addNewStatusMessageWithText:(NSString *)text spaceID:(NSUInteger)spaceID files:(NSArray *)files embedURL:(NSURL *)embedURL completion:(void (^)(PKTStatus *status, NSError *error))completion {
  NSArray *fileIDs = [files valueForKey:@"fileID"];
  PKTRequest *request = [PKTStatusAPI requestToAddNewStatusMessageWithText:text spaceID:spaceID files:fileIDs embedURL:embedURL];
  
  PKTRequestTaskHandle *handle = [[PKTClient currentClient] performRequest:request completion:[self requestCompletionBlockForCompletionBlock:completion]];

  return handle;
}

@end
