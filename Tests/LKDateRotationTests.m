//
//  LKDateRotationTests.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/06.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LKDateRotation.h"

@interface LKDateRotationTests : XCTestCase

@end

@implementation LKDateRotationTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (NSDate*)_dateWithYear:(NSInteger)year
                  month:(NSInteger)month
                    day:(NSInteger)day
                   hour:(NSInteger)hour
                 minute:(NSInteger)minute
                 second:(NSInteger)second {
    NSDateComponents* comp = NSDateComponents.new;
    comp.year = year;
    comp.month = month;
    comp.day = day;
    comp.hour = hour;
    comp.minute = minute;
    comp.second = second;
    
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [calendar dateFromComponents:comp];
    
    return comp.date;
}


- (void)testShouldRotateAtSecond
{
    BOOL result;
    // TEST CASE 1
    //
    // TARGET1[x] TARGET2[x] TARGET3[o] TARGET4[o]
    //     |          |          |          |
    //     V          |          |          |
    //   prev1        |     31[x]|32[o]     |
    //     |          |         |||         |
    //     V          V         VVV         V
    // ----+---------------------+-----------------
    //  rotate1               rotate1

    NSDate* prev1   = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:5 second:10];
    NSInteger rotate1 = 10;

    NSDate* target1 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:5 second:10];
    result   = [LKDateRotation shouldRotateAtSecond:rotate1 previousDate:prev1 targetDate:target1];
    XCTAssertFalse(result, @"");
    
    NSDate* target2 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:5 second:30];
    result   = [LKDateRotation shouldRotateAtSecond:rotate1 previousDate:prev1 targetDate:target2];
    XCTAssertFalse(result, @"");
    
    NSDate* target3 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:6 second:10];
    result   = [LKDateRotation shouldRotateAtSecond:rotate1 previousDate:prev1 targetDate:target3];
    XCTAssertTrue(result, @"");

    NSDate* target31 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:6 second:9];
    result   = [LKDateRotation shouldRotateAtSecond:rotate1 previousDate:prev1 targetDate:target31];
    XCTAssertFalse(result, @"");

    NSDate* target32 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:6 second:11];
    result   = [LKDateRotation shouldRotateAtSecond:rotate1 previousDate:prev1 targetDate:target32];
    XCTAssertTrue(result, @"");

    NSDate* target4 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:6 second:30];
    result   = [LKDateRotation shouldRotateAtSecond:rotate1 previousDate:prev1 targetDate:target4];
    XCTAssertTrue(result, @"");
    
    // TEST CASE 2
    //
    // TARGET21[x] TARGET22[x] TARGET23[o] TARGET24[o]
    //     |           |           |           |
    //     |           |           |           |
    //     |  prev21   |     231[x]|232[o]     |
    //     |     |     |          |||          |
    //     V     V     V          VVV          V
    // ----+-----------------------+-----------------
    //  rotate21                rotate21

    NSDate* prev21   = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:5 second:15];
    NSInteger rotate21 = 10;
    
    NSDate* target21 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:5 second:10];
    result   = [LKDateRotation shouldRotateAtSecond:rotate21 previousDate:prev21 targetDate:target21];
    XCTAssertFalse(result, @"");
    
    NSDate* target22 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:5 second:30];
    result   = [LKDateRotation shouldRotateAtSecond:rotate21 previousDate:prev21 targetDate:target22];
    XCTAssertFalse(result, @"");
    
    NSDate* target23 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:6 second:10];
    result   = [LKDateRotation shouldRotateAtSecond:rotate21 previousDate:prev21 targetDate:target23];
    XCTAssertTrue(result, @"");
    
    NSDate* target231 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:6 second:9];
    result   = [LKDateRotation shouldRotateAtSecond:rotate21 previousDate:prev21 targetDate:target231];
    XCTAssertFalse(result, @"");
    
    NSDate* target232 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:6 second:11];
    result   = [LKDateRotation shouldRotateAtSecond:rotate21 previousDate:prev21 targetDate:target232];
    XCTAssertTrue(result, @"");
    
    NSDate* target24 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:6 second:30];
    result   = [LKDateRotation shouldRotateAtSecond:rotate21 previousDate:prev21 targetDate:target24];
    XCTAssertTrue(result, @"");
}


- (void)testShouldRotateAtMinute
{
    BOOL result;
    // TEST CASE 1
    //
    // TARGET1[x] TARGET2[x] TARGET3[o] TARGET4[o]
    //     |          |          |          |
    //     V          |          |          |
    //   prev1        |     31[x]|32[o]     |
    //     |          |         |||         |
    //     V          V         VVV         V
    // ----+---------------------+-----------------
    //  rotate1               rotate1
    
    NSDate* prev1   = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:10 second:10];
    NSInteger rotate1 = 10;
    
    NSDate* target1 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMinute:rotate1 previousDate:prev1 targetDate:target1];
    XCTAssertFalse(result, @"target1");
    
    NSDate* target2 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:30 second:20];
    result   = [LKDateRotation shouldRotateAtMinute:rotate1 previousDate:prev1 targetDate:target2];
    XCTAssertFalse(result, @"target2");
    
    NSDate* target3 = [self _dateWithYear:2014 month:5 day:5 hour:6 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMinute:rotate1 previousDate:prev1 targetDate:target3];
    XCTAssertTrue(result, @"target3");
    
    NSDate* target31 = [self _dateWithYear:2014 month:5 day:5 hour:6 minute:9 second:59];
    result   = [LKDateRotation shouldRotateAtMinute:rotate1 previousDate:prev1 targetDate:target31];
    XCTAssertFalse(result, @"target31");
    
    NSDate* target32 = [self _dateWithYear:2014 month:5 day:5 hour:6 minute:10 second:1];
    result   = [LKDateRotation shouldRotateAtMinute:rotate1 previousDate:prev1 targetDate:target32];
    XCTAssertTrue(result, @"target32");
    
    NSDate* target4 = [self _dateWithYear:2014 month:5 day:5 hour:6 minute:20 second:10];
    result   = [LKDateRotation shouldRotateAtMinute:rotate1 previousDate:prev1 targetDate:target4];
    XCTAssertTrue(result, @"target4");
    
    // TEST CASE 2
    //
    // TARGET21[x] TARGET22[x] TARGET23[o] TARGET24[o]
    //     |           |           |           |
    //     |           |           |           |
    //     |  prev21   |     231[x]|232[o]     |
    //     |     |     |          |||          |
    //     V     V     V          VVV          V
    // ----+-----------------------+-----------------
    //  rotate21                rotate21

    NSDate* prev21   = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:15 second:10];
    NSInteger rotate21 = 10;
    
    NSDate* target21 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMinute:rotate21 previousDate:prev21 targetDate:target21];
    XCTAssertFalse(result, @"target21");
    
    NSDate* target22 = [self _dateWithYear:2014 month:5 day:5 hour:5 minute:30 second:20];
    result   = [LKDateRotation shouldRotateAtMinute:rotate21 previousDate:prev21 targetDate:target22];
    XCTAssertFalse(result, @"target22");
    
    NSDate* target23 = [self _dateWithYear:2014 month:5 day:5 hour:6 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMinute:rotate21 previousDate:prev21 targetDate:target23];
    XCTAssertTrue(result, @"target23");
    
    NSDate* target231 = [self _dateWithYear:2014 month:5 day:5 hour:6 minute:9 second:59];
    result   = [LKDateRotation shouldRotateAtMinute:rotate21 previousDate:prev21 targetDate:target231];
    XCTAssertFalse(result, @"target231");
    
    NSDate* target232 = [self _dateWithYear:2014 month:5 day:5 hour:6 minute:10 second:1];
    result   = [LKDateRotation shouldRotateAtMinute:rotate21 previousDate:prev21 targetDate:target232];
    XCTAssertTrue(result, @"target232");
    
    NSDate* target24 = [self _dateWithYear:2014 month:5 day:5 hour:6 minute:20 second:10];
    result   = [LKDateRotation shouldRotateAtMinute:rotate21 previousDate:prev21 targetDate:target24];
    XCTAssertTrue(result, @"target24");

}

- (void)testShouldRotateAtHour
{
    BOOL result;
    // TEST CASE 1
    //
    // TARGET1[x] TARGET2[x] TARGET3[o] TARGET4[o]
    //     |          |          |          |
    //     V          |          |          |
    //   prev1        |     31[x]|32[o]     |
    //     |          |         |||         |
    //     V          V         VVV         V
    // ----+---------------------+-----------------
    //  rotate1               rotate1
    
    NSDate* prev1   = [self _dateWithYear:2014 month:5 day:5 hour:10 minute:10 second:10];
    NSInteger rotate1 = 10;
    
    NSDate* target1 = [self _dateWithYear:2014 month:5 day:5 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtHour:rotate1 previousDate:prev1 targetDate:target1];
    XCTAssertFalse(result, @"target1");
    
    NSDate* target2 = [self _dateWithYear:2014 month:5 day:5 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtHour:rotate1 previousDate:prev1 targetDate:target2];
    XCTAssertFalse(result, @"target2");
    
    NSDate* target3 = [self _dateWithYear:2014 month:5 day:6 hour:10 minute:0 second:0];
    result   = [LKDateRotation shouldRotateAtHour:rotate1 previousDate:prev1 targetDate:target3];
    XCTAssertTrue(result, @"target3");
    
    NSDate* target31 = [self _dateWithYear:2014 month:5 day:6 hour:9 minute:59 second:59];
    result   = [LKDateRotation shouldRotateAtHour:rotate1 previousDate:prev1 targetDate:target31];
    XCTAssertFalse(result, @"target31");
    
    NSDate* target32 = [self _dateWithYear:2014 month:5 day:6 hour:10 minute:0 second:1];
    result   = [LKDateRotation shouldRotateAtHour:rotate1 previousDate:prev1 targetDate:target32];
    XCTAssertTrue(result, @"target32");
    
    NSDate* target4 = [self _dateWithYear:2014 month:5 day:6 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtHour:rotate1 previousDate:prev1 targetDate:target4];
    XCTAssertTrue(result, @"target4");
    
    // TEST CASE 2
    //
    // TARGET21[x] TARGET22[x] TARGET23[o] TARGET24[o]
    //     |           |           |           |
    //     |           |           |           |
    //     |  prev21   |     231[x]|232[o]     |
    //     |     |     |          |||          |
    //     V     V     V          VVV          V
    // ----+-----------------------+-----------------
    //  rotate21                rotate21

    NSDate* prev21   = [self _dateWithYear:2014 month:5 day:5 hour:15 minute:10 second:10];
    NSInteger rotate21 = 10;
    
    NSDate* target21 = [self _dateWithYear:2014 month:5 day:5 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtHour:rotate21 previousDate:prev21 targetDate:target21];
    XCTAssertFalse(result, @"target21");
    
    NSDate* target22 = [self _dateWithYear:2014 month:5 day:5 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtHour:rotate21 previousDate:prev21 targetDate:target22];
    XCTAssertFalse(result, @"target22");
    
    NSDate* target23 = [self _dateWithYear:2014 month:5 day:6 hour:10 minute:0 second:0];
    result   = [LKDateRotation shouldRotateAtHour:rotate21 previousDate:prev21 targetDate:target23];
    XCTAssertTrue(result, @"target23");
    
    NSDate* target231 = [self _dateWithYear:2014 month:5 day:6 hour:9 minute:59 second:59];
    result   = [LKDateRotation shouldRotateAtHour:rotate21 previousDate:prev21 targetDate:target231];
    XCTAssertFalse(result, @"target231");
    
    NSDate* target232 = [self _dateWithYear:2014 month:5 day:6 hour:10 minute:0 second:1];
    result   = [LKDateRotation shouldRotateAtHour:rotate21 previousDate:prev21 targetDate:target232];
    XCTAssertTrue(result, @"target232");
    
    NSDate* target24 = [self _dateWithYear:2014 month:5 day:6 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtHour:rotate21 previousDate:prev21 targetDate:target24];
    XCTAssertTrue(result, @"target24");
}

- (void)testShouldRotateAtDay
{
    BOOL result;
    // TEST CASE 1
    //
    // TARGET1[x] TARGET2[x] TARGET3[o] TARGET4[o]
    //     |          |          |          |
    //     V          |          |          |
    //   prev1        |     31[x]|32[o]     |
    //     |          |         |||         |
    //     V          V         VVV         V
    // ----+---------------------+-----------------
    //  rotate1               rotate1
    
    NSDate* prev1   = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10];
    NSInteger rotateD1 = 10;
    NSInteger rotateH1 = 10;
    
    NSDate* target1 = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtDay:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target1];
    XCTAssertFalse(result, @"target1");
    
    NSDate* target2 = [self _dateWithYear:2014 month:5 day:10 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtDay:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target2];
    XCTAssertFalse(result, @"target2");
    
    NSDate* target3 = [self _dateWithYear:2014 month:6 day:10 hour:10 minute:0 second:0];
    result   = [LKDateRotation shouldRotateAtDay:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target3];
    XCTAssertTrue(result, @"target3");
    
    NSDate* target31 = [self _dateWithYear:2014 month:6 day:10 hour:9 minute:59 second:59];
    result   = [LKDateRotation shouldRotateAtDay:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target31];
    XCTAssertFalse(result, @"target31");
    
    NSDate* target32 = [self _dateWithYear:2014 month:6 day:10 hour:10 minute:0 second:1];
    result   = [LKDateRotation shouldRotateAtDay:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target32];
    XCTAssertTrue(result, @"target32");
    
    NSDate* target4 = [self _dateWithYear:2014 month:6 day:20 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtDay:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target4];
    XCTAssertTrue(result, @"target4");
    
    // TEST CASE 2
    //
    // TARGET21[x] TARGET22[x] TARGET23[o] TARGET24[o]
    //     |           |           |           |
    //     |           |           |           |
    //     |  prev21   |     231[x]|232[o]     |
    //     |     |     |          |||          |
    //     V     V     V          VVV          V
    // ----+-----------------------+-----------------
    //  rotate21                rotate21

    NSDate* prev21   = [self _dateWithYear:2014 month:5 day:15 hour:10 minute:10 second:10];
    NSInteger rotateD21 = 10;
    NSInteger rotateH21 = 10;
    
    NSDate* target21 = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtDay:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target21];
    XCTAssertFalse(result, @"target21");
    
    NSDate* target22 = [self _dateWithYear:2014 month:5 day:10 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtDay:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target22];
    XCTAssertFalse(result, @"target22");
    
    NSDate* target23 = [self _dateWithYear:2014 month:6 day:10 hour:10 minute:0 second:0];
    result   = [LKDateRotation shouldRotateAtDay:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target23];
    XCTAssertTrue(result, @"target23");
    
    NSDate* target231 = [self _dateWithYear:2014 month:6 day:10 hour:9 minute:59 second:59];
    result   = [LKDateRotation shouldRotateAtDay:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target231];
    XCTAssertFalse(result, @"target231");
    
    NSDate* target232 = [self _dateWithYear:2014 month:6 day:10 hour:10 minute:0 second:1];
    result   = [LKDateRotation shouldRotateAtDay:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target232];
    XCTAssertTrue(result, @"target232");
    
    NSDate* target24 = [self _dateWithYear:2014 month:6 day:20 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtDay:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target24];
    XCTAssertTrue(result, @"target24");

}

- (void)testShouldRotateAtWeek
{
    BOOL result;
    // TEST CASE 1
    //
    //   w=7(Sat)   w=3(Tue)  w=7(Sat)    w=3(Tue)
    // TARGET1[x] TARGET2[x] TARGET3[o] TARGET4[o]
    //     |          |          |          |
    //     V          |          |          |
    //   prev1        |     31[x]|32[o]     |
    //     |          |         |||         |
    //     V          V         VVV         V
    // ----+---------------------+-----------------
    //  rotate1               rotate1
    //  w=7(Sat)              w=7(Sat)

    NSDate* prev1   = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10]; // 2014/5/10 -> Sat -> week=7
    NSInteger rotateW1 = 7; // Sat
    NSInteger rotateH1 = 10;
    
    NSDate* target1 = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW1 hour:rotateH1 previousDate:prev1 targetDate:target1];
    XCTAssertFalse(result, @"target1");
    
    NSDate* target2 = [self _dateWithYear:2014 month:5 day:13 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW1 hour:rotateH1 previousDate:prev1 targetDate:target2];
    XCTAssertFalse(result, @"target2");
    
    NSDate* target3 = [self _dateWithYear:2014 month:5 day:17 hour:10 minute:0 second:0];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW1 hour:rotateH1 previousDate:prev1 targetDate:target3];
    XCTAssertTrue(result, @"target3");
    
    NSDate* target31 = [self _dateWithYear:2014 month:5 day:17 hour:9 minute:59 second:59];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW1 hour:rotateH1 previousDate:prev1 targetDate:target31];
    XCTAssertFalse(result, @"target31");
    
    NSDate* target32 = [self _dateWithYear:2014 month:5 day:17 hour:10 minute:0 second:1];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW1 hour:rotateH1 previousDate:prev1 targetDate:target32];
    XCTAssertTrue(result, @"target32");
    
    NSDate* target4 = [self _dateWithYear:2014 month:5 day:20 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW1 hour:rotateH1 previousDate:prev1 targetDate:target4];
    XCTAssertTrue(result, @"target4");
    
    // TEST CASE 2
    //
    //   w=7(Sat)    w=3(Tue)    w=7(Sat)    w=3(Tue)
    // TARGET21[x] TARGET22[x] TARGET23[o] TARGET24[o]
    //     |           |           |           |
    //     | w=1(Sun)  |           |           |
    //     |  prev21   |     231[x]|232[o]     |
    //     |     |     |          |||          |
    //     V     V     V          VVV          V
    // ----+-----------------------+-----------------
    //  rotate21                rotate21
    //   w=7(Sat)               w=7(Sat)

    NSDate* prev21   = [self _dateWithYear:2014 month:5 day:11 hour:10 minute:10 second:10]; // 2014/5/11 -> Sun -> week=1
    NSInteger rotateW21 = 7;    // Sat
    NSInteger rotateH21 = 10;
    
    NSDate* target21 = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW21 hour:rotateH21 previousDate:prev21 targetDate:target21];
    XCTAssertFalse(result, @"target21");
    
    NSDate* target22 = [self _dateWithYear:2014 month:5 day:13 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW21 hour:rotateH21 previousDate:prev21 targetDate:target22];
    XCTAssertFalse(result, @"target22");
    
    NSDate* target23 = [self _dateWithYear:2014 month:5 day:17 hour:10 minute:0 second:0];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW21 hour:rotateH21 previousDate:prev21 targetDate:target23];
    XCTAssertTrue(result, @"target23");
    
    NSDate* target231 = [self _dateWithYear:2014 month:5 day:17 hour:9 minute:59 second:59];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW21 hour:rotateH21 previousDate:prev21 targetDate:target231];
    XCTAssertFalse(result, @"target231");
    
    NSDate* target232 = [self _dateWithYear:2014 month:5 day:17 hour:10 minute:0 second:1];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW21 hour:rotateH21 previousDate:prev21 targetDate:target232];
    XCTAssertTrue(result, @"target232");
    
    NSDate* target24 = [self _dateWithYear:2014 month:5 day:20 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtWeekday:rotateW21 hour:rotateH21 previousDate:prev21 targetDate:target24];
    XCTAssertTrue(result, @"target24");
}

- (void)testShouldRotateAtMonth
{
    BOOL result;
    // TEST CASE 1
    //
    // TARGET1[x] TARGET2[x] TARGET3[o] TARGET4[o]
    //     |          |          |          |
    //     V          |          |          |
    //   prev1        |     31[x]|32[o]     |
    //     |          |         |||         |
    //     V          V         VVV         V
    // ----+---------------------+-----------------
    //  rotate1               rotate1
    
    NSDate* prev1   = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10];
    NSInteger rotateM1 = 5;
    NSInteger rotateD1 = 10;
    NSInteger rotateH1 = 10;
    
    NSDate* target1 = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM1 day:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target1];
    XCTAssertFalse(result, @"target1");
    
    NSDate* target2 = [self _dateWithYear:2014 month:10 day:10 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM1 day:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target2];
    XCTAssertFalse(result, @"target2");
    
    NSDate* target3 = [self _dateWithYear:2015 month:5 day:10 hour:10 minute:0 second:0];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM1 day:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target3];
    XCTAssertTrue(result, @"target3");
    
    NSDate* target31 = [self _dateWithYear:2015 month:5 day:10 hour:9 minute:59 second:59];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM1 day:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target31];
    XCTAssertFalse(result, @"target31");
    
    NSDate* target32 = [self _dateWithYear:2015 month:5 day:10 hour:10 minute:0 second:1];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM1 day:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target32];
    XCTAssertTrue(result, @"target32");
    
    NSDate* target4 = [self _dateWithYear:2015 month:10 day:10 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM1 day:rotateD1 hour:rotateH1 previousDate:prev1 targetDate:target4];
    XCTAssertTrue(result, @"target4");
    
    
    // TEST CASE 2
    //
    // TARGET21[x] TARGET22[x] TARGET23[o] TARGET24[o]
    //     |           |           |           |
    //     |           |           |           |
    //     |  prev21   |     231[x]|232[o]     |
    //     |     |     |          |||          |
    //     V     V     V          VVV          V
    // ----+-----------------------+-----------------
    //  rotate21                rotate21

    NSDate* prev21   = [self _dateWithYear:2014 month:6 day:10 hour:10 minute:10 second:10];
    NSInteger rotateM21 = 5;
    NSInteger rotateD21 = 10;
    NSInteger rotateH21 = 10;
    
    NSDate* target21 = [self _dateWithYear:2014 month:5 day:10 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM21 day:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target21];
    XCTAssertFalse(result, @"target21");
    
    NSDate* target22 = [self _dateWithYear:2014 month:10 day:10 hour:20 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM21 day:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target22];
    XCTAssertFalse(result, @"target22");
    
    NSDate* target23 = [self _dateWithYear:2015 month:5 day:10 hour:10 minute:0 second:0];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM21 day:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target23];
    XCTAssertTrue(result, @"target23");
    
    NSDate* target231 = [self _dateWithYear:2015 month:5 day:10 hour:9 minute:59 second:59];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM21 day:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target231];
    XCTAssertFalse(result, @"target231");
    
    NSDate* target232 = [self _dateWithYear:2015 month:5 day:10 hour:10 minute:0 second:1];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM21 day:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target232];
    XCTAssertTrue(result, @"target232");
    
    NSDate* target24 = [self _dateWithYear:2015 month:10 day:10 hour:10 minute:10 second:10];
    result   = [LKDateRotation shouldRotateAtMonth:rotateM21 day:rotateD21 hour:rotateH21 previousDate:prev21 targetDate:target24];
    XCTAssertTrue(result, @"target24");
}

@end
