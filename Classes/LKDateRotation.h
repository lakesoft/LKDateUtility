//
//  Rotation Utility
//
//  Created by Hiroshi Hashiguchi on 2014/02/06.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKDateRotation : NSObject

//  previous date
//         |
//         |
// target: x      x      xoo     o
//         |      |      |||     |
//         |      |      |||     |
//         V      V      VVV     V
// --------+--------------+-----------------
//   rotatetiming   rotatetiming

// Every minute
// second : 0-59
+ (BOOL)shouldRotateAtSecond:(NSInteger)second previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate;
+ (BOOL)shouldRotateAtSecond:(NSInteger)second previousDate:(NSDate*)previousDate;  // targetDate == now

// Every hour
// minute : 0-59
+ (BOOL)shouldRotateAtMinute:(NSInteger)minute previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate;
+ (BOOL)shouldRotateAtMinute:(NSInteger)minute previousDate:(NSDate*)previousDate;  // targetDate == now

// Every day
// hour   : 0-23
+ (BOOL)shouldRotateAtHour:(NSInteger)hour previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate;
+ (BOOL)shouldRotateAtHour:(NSInteger)hour previousDate:(NSDate*)previousDate;  // targetDate == now

// Every Month
// day    : 1-28
// hour   : 0-23
+ (BOOL)shouldRotateAtDay:(NSInteger)day hour:(NSInteger)hour previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate;
+ (BOOL)shouldRotateAtDay:(NSInteger)day hour:(NSInteger)hour previousDate:(NSDate*)previousDate;   // targetDate == now;

// Every Week
// weekday: 1(Sun)-7(Sat)
// hour   : 0-23
+ (BOOL)shouldRotateAtWeekday:(NSInteger)weekday hour:(NSInteger)hour previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate;
+ (BOOL)shouldRotateAtWeekday:(NSInteger)weekday hour:(NSInteger)hour previousDate:(NSDate*)previousDate;   // targetDate == now;

// Every Year
// month  : 1-12
// day    : 1-28
// hour   : 0-23
+ (BOOL)shouldRotateAtMonth:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour previousDate:(NSDate*)previousDate targetDate:(NSDate*)targetDate;   // targetDate == now
+ (BOOL)shouldRotateAtMonth:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour previousDate:(NSDate*)previousDate;   // targetDate == now

@end
