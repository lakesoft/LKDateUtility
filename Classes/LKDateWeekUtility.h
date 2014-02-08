//
//  LKDateWeekUtility.h
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKDateWeekUtility : NSObject

+ (NSString*)descriptionForWeekday:(NSInteger)weekday;
+ (NSString*)shortDescriptionForWeekday:(NSInteger)weekday;

@end
