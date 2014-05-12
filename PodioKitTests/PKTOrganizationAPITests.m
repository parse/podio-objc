//
//  PKTOrganizationAPITests.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 12/05/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PKTOrganizationAPI.h"

@interface PKTOrganizationAPITests : XCTestCase

@end

@implementation PKTOrganizationAPITests

- (void)testRequestForAllOrganizations {
  PKTRequest *request = [PKTOrganizationAPI requestForAllOrganizations];
  expect(request.path).to.equal(@"/org/");
  expect(request.method).to.equal(PKTRequestMethodGET);
}

- (void)testRequestForOrganizationWithID {
  PKTRequest *request = [PKTOrganizationAPI requestForOrganizationsWithID:123];
  expect(request.path).to.equal(@"/org/123");
  expect(request.method).to.equal(PKTRequestMethodGET);
}

@end
