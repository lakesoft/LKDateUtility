//
//  LKDateUtility.h
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/06.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKDateUtility : NSObject

+ (BOOL)isTodayWithDate:(NSDate*)date;

+ (NSDate*)dateOfGregorianCalendarWithYear:(NSInteger)year
                                     month:(NSInteger)month
                                       day:(NSInteger)day
                                      hour:(NSInteger)hour
                                    minute:(NSInteger)minute
                                    second:(NSInteger)second;

@end
