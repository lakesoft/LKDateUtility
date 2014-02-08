//
//  LKDateFormatUtility.m
//  ScrapOne
//
//  Created by Hiroshi Hashiguchi on 2014/01/25.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKDateFormatUtility.h"
#import "LKDateUtility.h"

@implementation LKDateFormatUtility

#pragma mark -
+ (NSString*)minimumTimeStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.dateFormat = @"H:mm";
    return [formatter stringFromDate:date ? date : NSDate.date];
}

+ (NSString*)minimumDateStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.dateFormat = @"M/d";
    return [formatter stringFromDate:date ? date : NSDate.date];
}

#pragma mark - Time
+ (NSString*)shortStyleTimeStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.timeStyle = NSDateFormatterShortStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}

+ (NSString*)mediumStyleTimeStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.timeStyle = NSDateFormatterMediumStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}

+ (NSString*)longStyleTimeStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.timeStyle = NSDateFormatterLongStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}

+ (NSString*)fullStyleTimeStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.timeStyle = NSDateFormatterFullStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}

#pragma mark - Date
+ (NSString*)shortStyleDateStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.dateStyle = NSDateFormatterShortStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}

+ (NSString*)mediumStyleDateStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.dateStyle = NSDateFormatterMediumStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}

+ (NSString*)longStyleDateStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.dateStyle = NSDateFormatterLongStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}

+ (NSString*)fullStyleDateStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.dateStyle = NSDateFormatterFullStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}


#pragma mark -
+ (NSString*)shortStyleStringFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = NSDateFormatter.new;
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.dateStyle = NSDateFormatterShortStyle;
    return [formatter stringFromDate:date ? date : NSDate.date];
}

#pragma mark -
+ (NSString*)flexibleFormatStringFromDate:(NSDate*)date
{
    if ([LKDateUtility isTodayWithDate:date]) {
        return [self minimumTimeStringFromDate:date];
    } else {
        return [self minimumDateStringFromDate:date];
    }
}

@end
