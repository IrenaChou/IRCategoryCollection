//
//  IRNSString.m
//  IRCategoryCollection
//
//  Created by qiaoqiao on 2017/5/10.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+IRDate.h"
#import "NSDate+IRString.h"

@interface IRNSStringTests : XCTestCase

@end

@implementation IRNSStringTests
-(void)testGetDateString{
    NSString *todayStr = [NSDate getTodayStringDate];
    NSLog(@"%@",todayStr);
    
    
    XCTAssert([@"2017-06-15" isEqualToString:todayStr],@"getTodayStringDate 返回结果错误");

    // 对比对象的时候比对的是对象的地址
//    XCTAssertEqual()
}

-(void)testDate{
    NSString* dateStr = @"2017-05-10";
    
    // 异步测试
//    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
//    调用fullfill来通知异步测试满足条件
//    [expectation fulfill];
    
    
    
    XCTAssertNotNil(dateStr,@"");
    XCTAssertNotNil([dateStr getDate],@"");


    XCTAssertNotNil([NSString getStringWithDate:[NSDate date]],@"【error】转换失败");
    NSLog(@"%@",[NSString getStringWithDate:[NSDate date]]);
    NSLog(@"%@",[NSString getStringWithDate:nil]);
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
    int a = 3;
    XCTAssertTrue(a != 0,@"a 不等于 0 ");
}

- (void)testPerformanceExample {
    // 测试性能的方法
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        //// 需要测试性能的代码
    }];
}

@end
