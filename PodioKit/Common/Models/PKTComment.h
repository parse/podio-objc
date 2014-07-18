//
//  PKTComment.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 22/04/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTModel.h"
#import "PKTConstants.h"

@class PKTEmbed;
@class PKTFile;
@class PKTRequestTaskHandle;

@interface PKTComment : PKTModel

@property (nonatomic, readonly) NSUInteger commentID;
@property (nonatomic, readonly) PKTReferenceType referenceType;
@property (nonatomic, readonly) NSUInteger referenceID;
@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic, copy, readonly) NSString *richValue;
@property (nonatomic, strong, readonly) PKTEmbed *embed;
@property (nonatomic, strong, readonly) PKTFile *embedFile;
@property (nonatomic, copy, readonly) NSArray *files;

#pragma mark - API

+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType completion:(void (^)(PKTComment *comment, NSError *error))completion;
+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType files:(NSArray *)files completion:(void (^)(PKTComment *comment, NSError *error))completion;
+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType files:(NSArray *)files embedID:(NSUInteger)embedID completion:(void (^)(PKTComment *comment, NSError *error))completion;
+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType files:(NSArray *)files embedURL:(NSURL *)embedURL completion:(void (^)(PKTComment *comment, NSError *error))completion;

@end