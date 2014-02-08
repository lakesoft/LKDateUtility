//
//  LKDateFormatUtility.h
//  ScrapOne
//
//  Created by Hiroshi Hashiguchi on 2014/01/25.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKDateFormatUtility : NSObject

#pragma mark -
+ (NSString*)minimumTimeStringFromDate:(NSDate*)date;       // 1:01
+ (NSString*)minimumDateStringFromDate:(NSDate*)date;       // 1/1

#pragma mark - Time
+ (NSString*)shortStyleTimeStringFromDate:(NSDate*)date;
+ (NSString*)mediumStyleTimeStringFromDate:(NSDate*)date;
+ (NSString*)longStyleTimeStringFromDate:(NSDate*)date;
+ (NSString*)fullStyleTimeStringFromDate:(NSDate*)date;

#pragma mark - Date
+ (NSString*)shortStyleDateStringFromDate:(NSDate*)date;
+ (NSString*)mediumStyleDateStringFromDate:(NSDate*)date;
+ (NSString*)longStyleDateStringFromDate:(NSDate*)date;
+ (NSString*)fullStyleDateStringFromDate:(NSDate*)date;

#pragma mark -
+ (NSString*)shortStyleStringFromDate:(NSDate*)date;

#pragma mark -
+ (NSString*)flexibleFormatStringFromDate:(NSDate*)date;    // 1:01 or 1/1

@end
