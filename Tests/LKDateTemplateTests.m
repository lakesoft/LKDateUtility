//
//  LKDateTemplate.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/10.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LKDateTemplate.h"

@interface LKDateTemplateTests : XCTestCase

@end

@implementation LKDateTemplateTests

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

- (void)testConvertWithTemplate
{
    NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    NSDate* date01 = [self _dateWithYear:2014 month:1 day:1 hour:0 minute:0 second:0];
    NSDate* date02 = [self _dateWithYear:2014 month:12 day:31 hour:23 minute:59 second:59];
    NSDate* date03 = [self _dateWithYear:2014 month:12 day:31 hour:1 minute:0 second:0];
    
    NSString* tmp10 = @"%y,%yy,%yyyy";
    NSString* exp11 = @"2014,14,2014";
    NSString* res11 = [LKDateTemplate convertWithTemplate:tmp10 date:date01 locale:locale];
    XCTAssertEqualObjects(res11, exp11, @"%@", tmp10);

    NSString* tmp20 = @"%M,%MM,%MMM,%MMMM";
    NSString* exp21 = @"1,01,Jan,January";
    NSString* res21 = [LKDateTemplate convertWithTemplate:tmp20 date:date01 locale:locale];
    XCTAssertEqualObjects(res21, exp21, @"%@", tmp20);
    NSString* exp22 = @"12,12,Dec,December";
    NSString* res22 = [LKDateTemplate convertWithTemplate:tmp20 date:date02 locale:locale];
    XCTAssertEqualObjects(res22, exp22, @"%@", tmp20);
    
    NSString* tmp30 = @"%d,%dd";
    NSString* exp31 = @"1,01";
    NSString* res31 = [LKDateTemplate convertWithTemplate:tmp30 date:date01 locale:locale];
    XCTAssertEqualObjects(res31, exp31, @"%@", tmp30);
    NSString* exp32 = @"31,31";
    NSString* res32 = [LKDateTemplate convertWithTemplate:tmp30 date:date02 locale:locale];
    XCTAssertEqualObjects(res32, exp32, @"%@", tmp30);

    NSString* tmp40 = @"%eee,%eeee";
    NSString* exp41 = @"Wed,Wednesday";
    NSString* res41 = [LKDateTemplate convertWithTemplate:tmp40 date:date01 locale:locale];
    XCTAssertEqualObjects(res41, exp41, @"%@", tmp40);
    NSString* exp42 = @"Wed,Wednesday";
    NSString* res42 = [LKDateTemplate convertWithTemplate:tmp40 date:date02 locale:locale];
    XCTAssertEqualObjects(res42, exp42, @"%@", tmp40);

    NSString* tmp50 = @"%k,%kk,%h,%hh,%H,%HH";
    NSString* exp51 = @"24,24,12,12,0,00";
    NSString* res51 = [LKDateTemplate convertWithTemplate:tmp50 date:date01 locale:locale];
    XCTAssertEqualObjects(res51, exp51, @"%@", tmp50);
    NSString* exp52 = @"23,23,11,11,23,23";
    NSString* res52 = [LKDateTemplate convertWithTemplate:tmp50 date:date02 locale:locale];
    XCTAssertEqualObjects(res52, exp52, @"%@", tmp50);
    NSString* exp53 = @"1,01,1,01,1,01";
    NSString* res53 = [LKDateTemplate convertWithTemplate:tmp50 date:date03 locale:locale];
    XCTAssertEqualObjects(res53, exp53, @"%@", tmp50);

    NSString* tmp60 = @"%m,%mm";
    NSString* exp61 = @"0,00";
    NSString* res61 = [LKDateTemplate convertWithTemplate:tmp60 date:date01 locale:locale];
    XCTAssertEqualObjects(res61, exp61, @"%@", tmp60);
    NSString* exp62 = @"59,59";
    NSString* res62 = [LKDateTemplate convertWithTemplate:tmp60 date:date02 locale:locale];
    XCTAssertEqualObjects(res62, exp62, @"%@", tmp60);

    NSString* tmp70 = @"%s,%ss";
    NSString* exp71 = @"0,00";
    NSString* res71 = [LKDateTemplate convertWithTemplate:tmp70 date:date01 locale:locale];
    XCTAssertEqualObjects(res71, exp71, @"%@", tmp70);
    NSString* exp72 = @"59,59";
    NSString* res72 = [LKDateTemplate convertWithTemplate:tmp70 date:date02 locale:locale];
    XCTAssertEqualObjects(res72, exp72, @"%@", tmp70);

    NSString* tmp80 = @"%a";
    NSString* exp81 = @"AM";
    NSString* res81 = [LKDateTemplate convertWithTemplate:tmp80 date:date01 locale:locale];
    XCTAssertEqualObjects(res81, exp81, @"%@", tmp80);
    NSString* exp82 = @"PM";
    NSString* res82 = [LKDateTemplate convertWithTemplate:tmp80 date:date02 locale:locale];
    XCTAssertEqualObjects(res82, exp82, @"%@", tmp80);
}

@end
