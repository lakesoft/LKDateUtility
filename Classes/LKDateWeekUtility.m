//
//  LKDateWeekUtility.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKDateWeekUtility.h"

@implementation LKDateWeekUtility

#pragma mark - Privates
+ (NSDate*)_dateWithWeekday:(NSInteger)weekday
{
    if (weekday <= 0) {
        weekday = 1;
    }
    if (weekday >= 7) {
        weekday = 7;
    }
    
    // 1970/1/1 => Thu (weekday=5)
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents* components = NSDateComponents.new;
    components.day = -5 + weekday;
    NSDate* date = [calendar dateByAddingComponents:components
                                             toDate:[NSDate dateWithTimeIntervalSince1970:0]
                                            options:0];
    return date;
}

#pragma mark - API
+ (NSString*)descriptionForWeekday:(LKDateWeekday)weekday
{
    NSDateFormatter* df = NSDateFormatter.new;
    df.dateFormat = @"EEEE";
    NSDate* date = [self _dateWithWeekday:weekday];
    return [df stringFromDate:date];
}

+ (NSString*)shortDescriptionForWeekday:(LKDateWeekday)weekday
{
    NSDateFormatter* df = NSDateFormatter.new;
    df.dateFormat = @"EE";
    NSDate* date = [self _dateWithWeekday:weekday];
    return [df stringFromDate:date];
}

@end
