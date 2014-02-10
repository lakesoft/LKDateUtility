//
//  LKDateUtilityBundle.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/11.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKDateUtilityBundle.h"

@implementation LKDateUtilityBundle

+ (NSBundle*)bundle
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LKDateUtility-Resources" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    return bundle;
}

@end
