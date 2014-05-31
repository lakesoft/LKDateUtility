//
//  LKAppDelegate.m
//  LKDateUtility
//
//  Created by Hiroshi Hashiguchi on 2014/02/06.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKAppDelegate.h"
#import "LKDateWeekUtility.h"
#import "LKDateTemplate.h"
#import "LKDateTemplateDescription.h"

@implementation LKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    for (NSInteger i=1; i <= 7; i++) {
        NSLog(@"%zd: %@", i, [LKDateWeekUtility descriptionForWeekday:i]);
    }
    
    for (NSInteger i=1; i <= 7; i++) {
        NSLog(@"%zd: %@", i, [LKDateWeekUtility shortDescriptionForWeekday:i]);
    }
    
    NSString* template;
    
    template = @"%date";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    template = @"%date1";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    template = @"%date2";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    template = @"%date3";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    template = @"%date4";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%time";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    template = @"%time1";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    template = @"%time2";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    template = @"%time3";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    template = @"%time4";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%y, %yy, %yyyy";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%M, %MM, %MMM, %MMMM";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%d, %dd";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%eee, %eeee";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%h, %hh";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%k, %kk";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);
    
    template = @"%H, %HH";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%m, %mm";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%s, %ss";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%a";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%zzz";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%zzzz";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%ZZZ";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    template = @"%ZZZZ";
    NSLog(@"'%@' => %@", template, [LKDateTemplate convertWithTemplate:template]);

    for (int i=0; i < LKDateTemplate.numberOfKeywords; i++) {
        LKDateTemplateDescription* desc = [LKDateTemplate descriptionAtIndex:i];
        NSLog(@"%@: %@", desc.title, desc.keywords);
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
