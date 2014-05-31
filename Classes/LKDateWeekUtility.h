//
//  LKDateWeekUtility.h
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LKDateWeekday) {
    LKDateWeekdaySunday     = 1,
    LKDateWeekdayMonday     = 2,
    LKDateWeekdayTuesday    = 3,
    LKDateWeekdayWednesday  = 4,
    LKDateWeekdayThursday   = 5,
    LKDateWeekdayFriday     = 6,
    LKDateWeekdaySaturday   = 7
};

@interface LKDateWeekUtility : NSObject

+ (NSString*)descriptionForWeekday:(LKDateWeekday)weekday;
+ (NSString*)shortDescriptionForWeekday:(LKDateWeekday)weekday;

+ (NSInteger)weeksFromFirstMondayIn1970ForDate:(NSDate*)date;

@end
