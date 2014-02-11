//
//  LKDateTemplate.h
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/10.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LKDateTemplateDescription;
@interface LKDateTemplate : NSObject

#pragma mark - Files
// LKDateTemplate.plist    ... Keyword mappings
// LKDateTtemplate.strings ... Keyword title (localized)

#pragma mark - Converter
+ (NSString*)convertWithTemplate:(NSString*)template;
+ (NSString*)convertWithTemplate:(NSString*)template date:(NSDate*)date;
+ (NSString*)convertWithTemplate:(NSString*)template date:(NSDate*)date locale:(NSLocale*)locale;

#pragma mark - Keyword list
+ (NSInteger)numberOfKeywords;
+ (LKDateTemplateDescription*)descriptionAtIndex:(NSInteger)index;

@end
