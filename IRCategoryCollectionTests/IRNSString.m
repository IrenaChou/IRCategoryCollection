//
//  IRNSString.m
//  IRCategoryCollection
//
//  Created by qiaoqiao on 2017/5/10.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+IRDate.h"

@interface IRNSString : XCTestCase

@end

@implementation IRNSString

-(void)testDate{
    NSString* dateStr = @"2017-05-10";
    XCTAssertNotNil([dateStr getDate],@"【error】转换失败");
    
    NSLog(@"%@",[dateStr getDate]);
    
    XCTAssertNotNil([NSString getStringWithDate:[NSDate date]],@"【error】转换失败");
    NSLog(@"%@",[NSString getStringWithDate:[NSDate date]]);
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
