//
//  LKDateTemplateDescription.h
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/11.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKDateTemplateDescription : NSObject

@property (strong, nonatomic) NSString* title;      // e.g.) "Week"
@property (strong, nonatomic) NSString* keywords;   // e.g.) "%e %E"

@end
