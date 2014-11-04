//
//  PKTConversationsAPI.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 02/11/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTBaseAPI.h"

@interface PKTConversationsAPI : PKTBaseAPI

+ (PKTRequest *)requestForConversationsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

+ (PKTRequest *)requestForEventsInConversationWithID:(NSUInteger)conversationID offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end