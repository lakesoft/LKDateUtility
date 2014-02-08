//
//  LKDateRotation.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/06.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKDateRotation.h"

@implementation LKDateRotation

#pragma mark - Privates
+ (NSCalendar*)_calendar
{
    // non atomic
    static NSCalendar* _calendar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    });
    return _calendar;
}

+ (NSDateComponents*)_componentsFromDate:(NSDate*)date
{
    NSDateComponents* components = [self._calendar components:
                                    NSSecondCalendarUnit  |
                                    NSMinuteCalendarUnit  |
                                    NSHourCalendarUnit    |
                                    NSDayCalendarUnit     |
                                    NSWeekdayCalendarUnit |
                                    NSMonthCalendarUnit   |
                                    NSYearCalendarUnit
                                                     fromDate:date];
    return components;
}

+ (NSDateComponents*)_dateComponentsByAddingYear:(NSInteger)year
                                           month:(NSInteger)month
                                             day:(NSInteger)day
                                            hour:(NSInteger)hour
                                          minute:(NSInteger)minute
                                          toDate:(NSDate*)toDate
{
    NSDateComponents* tmpComp = NSDateComponents.new;
    tmpComp.year   = year;
    tmpComp.month  = month;
    tmpComp.day    = day;
    tmpComp.hour   = hour;
    tmpComp.minute = minute;
    NSDate* date = [self._calendar dateByAddingComponents:tmpComp toDate:toDate options:0];
    NSDateComponents* limitComp = [self _componentsFromDate:date];
    return limitComp;
}


#pragma mark - API
+ (BOOL)shouldRotateAtSecond:(NSInteger)second previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate
{
    if (previousDate == nil) {
        return YES;
    }
    
    targetDate = targetDate ?targetDate : NSDate.date;
    NSDateComponents* previousComp = [self _componentsFromDate:previousDate];
    if (0 <= second && second <= 59) {
        NSDateComponents* limitComp = [self _dateComponentsByAddingYear:0
                                                                  month:0
                                                                    day:0
                                                                   hour:0
                                                                 minute:previousComp.second >= second ? 1 : 0
                                                                 toDate:previousDate];
        limitComp.second = second;
        NSDate* limitDate = [self._calendar dateFromComponents:limitComp];
//        NSLog(@"prev-target-limit: %@ <=> %@ <=> %@", previousDate, targetDate, limitDate);
        return [limitDate compare:targetDate] != NSOrderedDescending;
        
    } else {
        return NO;
    }
}
+ (BOOL)shouldRotateAtSecond:(NSInteger)second previousDate:(NSDate*)previousDate
{
    return [self shouldRotateAtSecond:second previousDate:previousDate targetDate:nil];
}

+ (BOOL)shouldRotateAtMinute:(NSInteger)minute previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate
{
    if (previousDate == nil) {
        return YES;
    }
    
    targetDate = targetDate ?targetDate : NSDate.date;
    NSDateComponents* previousComp = [self _componentsFromDate:previousDate];
    if (0 <= minute && minute <= 59) {
        NSDateComponents* limitComp = [self _dateComponentsByAddingYear:0
                                                                  month:0
                                                                    day:0
                                                                   hour:previousComp.minute >= minute ? 1 : 0
                                                                 minute:0
                                                                 toDate:previousDate];
        limitComp.minute = minute;
        limitComp.second = 0;
        NSDate* limitDate = [self._calendar dateFromComponents:limitComp];
//        NSLog(@"prev:%@ <=> target:%@ <=> limit:%@", previousDate, targetDate, limitDate);
        return [limitDate compare:targetDate] != NSOrderedDescending;
        
    } else {
        return NO;
    }
}
+ (BOOL)shouldRotateAtMinute:(NSInteger)minute previousDate:(NSDate*)previousDate
{
    return [self shouldRotateAtMinute:minute previousDate:previousDate targetDate:nil];
}

+ (BOOL)shouldRotateAtHour:(NSInteger)hour previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate
{
    if (previousDate == nil) {
        return YES;
    }
    
    targetDate = targetDate ?targetDate : NSDate.date;
    NSDateComponents* previousComp = [self _componentsFromDate:previousDate];
    if (0 <= hour && hour <= 23) {
        NSDateComponents* limitComp = [self _dateComponentsByAddingYear:0
                                                                  month:0
                                                                    day:previousComp.hour >= hour ? 1 : 0
                                                                   hour:0
                                                                 minute:0
                                                                 toDate:previousDate];
        limitComp.hour = hour;
        limitComp.minute = 0;
        limitComp.second = 0;
        NSDate* limitDate = [self._calendar dateFromComponents:limitComp];
//        NSLog(@"prev:%@ <=> target:%@ <=> limit:%@", previousDate, targetDate, limitDate);
        return [limitDate compare:targetDate] != NSOrderedDescending;
        
    } else {
        return NO;
    }
}
+ (BOOL)shouldRotateAtHour:(NSInteger)hour previousDate:(NSDate*)previousDate
{
    return [self shouldRotateAtHour:hour previousDate:previousDate targetDate:nil];
}

+ (BOOL)shouldRotateAtDay:(NSInteger)day hour:(NSInteger)hour previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate
{
    if (previousDate == nil) {
        return YES;
    }
    
    targetDate = targetDate ?targetDate : NSDate.date;
    NSDateComponents* previousComp = [self _componentsFromDate:previousDate];
    if (1 <= day && day <= 28) {
        NSDateComponents* limitComp = [self _dateComponentsByAddingYear:0
                                                                  month:previousComp.day >= day ? 1 : 0
                                                                    day:0
                                                                   hour:0
                                                                 minute:0
                                                                 toDate:previousDate];
        limitComp.day = day;
        limitComp.hour = hour;
        limitComp.minute = 0;
        limitComp.second = 0;
        NSDate* limitDate = [self._calendar dateFromComponents:limitComp];
//        NSLog(@"prev:%@ <=> target:%@ <=> limit:%@", previousDate, targetDate, limitDate);
        return [limitDate compare:targetDate] != NSOrderedDescending;
        
    } else {
        return NO;
    }
}
+ (BOOL)shouldRotateAtDay:(NSInteger)day hour:(NSInteger)hour previousDate:(NSDate*)previousDate
{
    return [self shouldRotateAtDay:day hour:hour previousDate:previousDate targetDate:nil];
}

+ (BOOL)shouldRotateAtWeekday:(NSInteger)weekday hour:(NSInteger)hour previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate
{
    if (previousDate == nil) {
        return YES;
    }
    
    targetDate = targetDate ?targetDate : NSDate.date;
    NSDateComponents* previousComp = [self _componentsFromDate:previousDate];
    if (1 <= weekday && weekday <= 7) {
        // *=prev / ^=target / |=limit
        //        1 2 3 4 5 6 7 1 2 3 4 5 6 7 ...
        // case1  ^   *             |
        // case2      *^            |
        // case3      *     ^|
        // case4  *   ^|
        // case7  *         ^|
//        NSLog(@"prev=%d, target=%d", previousComp.weekday, weekday);
        NSDateComponents* limitComp = [self _dateComponentsByAddingYear:0
                                                                  month:0
                                                                    day:previousComp.weekday < weekday ? weekday - previousComp.weekday : previousComp.weekday-weekday+7
                                                                   hour:0
                                                                 minute:0
                                                                 toDate:previousDate];
        limitComp.hour   = hour;
        limitComp.minute = 0;
        limitComp.second = 0;
        NSDate* limitDate = [self._calendar dateFromComponents:limitComp];
//        NSLog(@"prev:%@ <=> target:%@ <=> limit:%@", previousDate, targetDate, limitDate);
        return [limitDate compare:targetDate] != NSOrderedDescending;
    
    } else {
        return NO;
    }
}
+ (BOOL)shouldRotateAtWeekday:(NSInteger)weekday hour:(NSInteger)hour previousDate:(NSDate*)previousDate
{
    return [self shouldRotateAtWeekday:weekday hour:hour previousDate:previousDate targetDate:nil];
}

+ (BOOL)shouldRotateAtMonth:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate
{
    if (previousDate == nil) {
        return YES;
    }
    
    targetDate = targetDate ?targetDate : NSDate.date;
    NSDateComponents* previousComp = [self _componentsFromDate:previousDate];
    if (1 <= month && month <= 12) {
        NSDateComponents* limitComp = [self _dateComponentsByAddingYear:previousComp.month >= month ? 1 : 0
                                                                  month:0
                                                                    day:0
                                                                   hour:0
                                                                 minute:0
                                                                 toDate:previousDate];
        limitComp.month  = month;
        limitComp.day    = day;
        limitComp.hour   = hour;
        limitComp.minute = 0;
        limitComp.second = 0;
        NSDate* limitDate = [self._calendar dateFromComponents:limitComp];
//        NSLog(@"prev:%@ <=> target:%@ <=> limit:%@", previousDate, targetDate, limitDate);
        return [limitDate compare:targetDate] != NSOrderedDescending;
        
    } else {
        return NO;
    }
}
+ (BOOL)shouldRotateAtMonth:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour previousDate:(NSDate*)previousDate
{
    return [self shouldRotateAtMonth:month day:day hour:hour previousDate:previousDate];
}


@end
