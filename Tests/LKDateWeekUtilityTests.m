//
//  LKDateWeekUtilityTests.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/05/31.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LKDateWeekUtility.h"

@interface LKDateWeekUtilityTests : XCTestCase

@end

@implementation LKDateWeekUtilityTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWeeks
{
    NSDateComponents* components01 = NSDateComponents.new;
    components01.year = 1970;
    components01.month = 1;
    components01.day = 5;
    NSDate* date01 = [NSCalendar.currentCalendar dateFromComponents:components01];
    NSInteger weeks01 = 0;
    NSInteger result01 = [LKDateWeekUtility weeksFromFirstMondayIn1970ForDate:date01];
    XCTAssertEqual(weeks01, result01);

    NSDateComponents* components02 = NSDateComponents.new;
    components02.year = 1970;
    components02.month = 1;
    components02.day = 11;
    NSDate* date02 = [NSCalendar.currentCalendar dateFromComponents:components02];
    NSInteger weeks02 = 0;
    NSInteger result02 = [LKDateWeekUtility weeksFromFirstMondayIn1970ForDate:date02];
    XCTAssertEqual(weeks02, result02);

    NSDateComponents* components03 = NSDateComponents.new;
    components03.year = 1970;
    components03.month = 1;
    components03.day = 12;
    NSDate* date03 = [NSCalendar.currentCalendar dateFromComponents:components03];
    NSInteger weeks03 = 1;
    NSInteger result03 = [LKDateWeekUtility weeksFromFirstMondayIn1970ForDate:date03];
    XCTAssertEqual(weeks03, result03);
    
    NSDateComponents* components11 = NSDateComponents.new;
    components11.year = 2013;
    components11.month = 9;
    components11.day = 23;
    NSDate* date11 = [NSCalendar.currentCalendar dateFromComponents:components11];
    NSInteger weeks11 = 2281;
    NSInteger result11 = [LKDateWeekUtility weeksFromFirstMondayIn1970ForDate:date11];
    XCTAssertEqual(weeks11, result11);

    NSDateComponents* components12 = NSDateComponents.new;
    components12.year = 2014;
    components12.month = 1;
    components12.day = 6;
    NSDate* date12 = [NSCalendar.currentCalendar dateFromComponents:components12];
    NSInteger weeks12 = 2296;
    NSInteger result12 = [LKDateWeekUtility weeksFromFirstMondayIn1970ForDate:date12];
    XCTAssertEqual(weeks12, result12);
}

@end
