//
//  LKDateTemplate.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/10.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKDateTemplate.h"
#import "LKDateUtilityBundle.h"
#import "LKDateTemplateDescription.h"

NS_ENUM(NSInteger, LKDateTemplateType) {
    LKDateTemplateTypeStringDate = 11,
    LKDateTemplateTypeStringTime = 12,
    LKDateTemplateTypePart = 21,
};;

@implementation LKDateTemplate

#pragma mark - Privates

+ (NSArray*)_keywords
{
    static NSArray* _keywords = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _keywords = [NSArray arrayWithContentsOfFile:[LKDateUtilityBundle.bundle
                                                      pathForResource:NSStringFromClass(self) ofType:@"plist"]];
    });
    return _keywords;
}

#pragma mark - API
+ (NSString*)convertWithTemplate:(NSString*)template
{
    return [self convertWithTemplate:template date:nil locale:nil];
}

+ (NSString*)convertWithTemplate:(NSString*)template date:(NSDate*)date
{
    return [self convertWithTemplate:template date:date locale:nil];
}

+ (NSString*)convertWithTemplate:(NSString*)template date:(NSDate*)date locale:(NSLocale*)locale
{
    date = date ? date : NSDate.date;
    NSString* result = template;
    NSArray* keywords = [self._keywords sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj2[@"descKey"] compare:obj1[@"descKey"]]; //reverse
    }];
    for (NSDictionary* keyword in keywords) {
        NSDictionary* keyMap = keyword[@"keyMap"];
        NSArray* keys = [keyMap keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj2 compare:obj1]; //reverse
        }];
        NSInteger type = ((NSNumber*)keyword[@"type"]).integerValue;
        
        for (NSString* key in keys) {
            if ([result rangeOfString:key].length > 0) {
                NSDateFormatter* df = NSDateFormatter.new;
                df.locale = locale;
                switch (type) {
                    case LKDateTemplateTypePart:
                        df.dateFormat = keyMap[key];
                        break;
                        
                    case LKDateTemplateTypeStringDate:
                        df.dateStyle = ((NSNumber*)keyMap[key]).integerValue;
                        break;
                        
                    case LKDateTemplateTypeStringTime:
                        df.timeStyle = ((NSNumber*)keyMap[key]).integerValue;
                        break;
                }
                NSString* dateTimeString = [df stringFromDate:date];
                result = [result stringByReplacingOccurrencesOfString:key withString:dateTimeString];
            }
        }
    }
    return result;
}

+ (NSInteger)numberOfKeywords
{
    return self._keywords.count;
}

+ (LKDateTemplateDescription*)descriptionAtIndex:(NSInteger)index
{
    LKDateTemplateDescription* desc = LKDateTemplateDescription.new;
    desc.title = NSLocalizedStringFromTableInBundle(self._keywords[index][@"descKey"],
                                                    nil,
                                                    LKDateUtilityBundle.bundle,
                                                    nil);
    NSMutableString* string = NSMutableString.string;
    NSArray* array = [self._keywords[index][@"keyMap"]
                      keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                          return [obj1 compare:obj2];
                      }];
    for (NSString* word in array) {
        [string appendFormat:@"%@ ", word];
    }
    desc.keywords = [string stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
    return desc;
}

@end
