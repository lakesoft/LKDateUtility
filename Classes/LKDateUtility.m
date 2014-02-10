//
//  LKDateUtility.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/06.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKDateUtility.h"

@implementation LKDateUtility

+ (BOOL)isTodayWithDate:(NSDate*)date
{
    if (date == nil) {
        return NO;
    }
    NSCalendar* calendar = NSCalendar.currentCalendar;
    NSDateComponents* c1 = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                       fromDate:date];
    NSDateComponents* c2 = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                       fromDate:NSDate.date];
    
    BOOL result = (c1.year == c2.year) && (c1.month == c2.month) && (c1.day == c2.day);
    return result;
}


+ (NSDate*)dateOfGregorianCalendarWithYear:(NSInteger)year
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
@end
