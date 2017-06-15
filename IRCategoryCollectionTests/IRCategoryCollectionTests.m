//
//  IRCategoryCollectionTests.m
//  IRCategoryCollectionTests
//
//  Created by qiaoqiao on 2017/5/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface IRCategoryCollectionTests : XCTestCase

@end

@implementation IRCategoryCollectionTests
// 测试是否为单例
- (void)testAudioManagerSingle {
    
    // 要在并发条件下测试
    
//    NSMutableArray *managers = [NSMutableArray array];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        QAudioManager *tempManager = [[QAudioManager alloc] init];
//        [managers addObject:tempManager];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        QAudioManager *tempManager = [[QAudioManager alloc] init];
//        [managers addObject:tempManager];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        QAudioManager *tempManager = [QAudioManager defaultManager];
//        [managers addObject:tempManager];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        QAudioManager *tempManager = [QAudioManager defaultManager];
//        [managers addObject:tempManager];
    });
    
//    QAudioManager *managerOne = [QAudioManager defaultManager];
    
    // 这里是判断数组中的对象是否一致
//    [managers enumerateObjectsUsingBlock:^(QAudioManager *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        XCTAssertEqualObjects(managerOne, obj, @"QAudioManager is single");
        
//        XCTAssertNotEqualObjects(managerOne, obj, @"QAudioManager is not single");
//    }];
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
        // 需要测试性能的代码
//        NSTimeInterval start = CACurrentMediaTime();
//        
//        // 测试用例，循环10000次，为了演示效果
//        for (NSInteger i = 0; i < 10000; i++) {
////            [Person personWithDict:@{@"name":@"zhang", @"age":@20}];
//            NSLog(@"%zd",i);
//        }
//        
//        // 传统测试代码耗时方法
//        NSLog(@"%lf, 不是说不让用nslog", CACurrentMediaTime() - start);
    }];
}

@end
