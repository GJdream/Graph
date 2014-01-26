//
//  GRAppDelegate.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRAppDelegate.h"

#import "GRSession.h"

@implementation GRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    return YES;
}
							
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSArray *pathComponents = [url.absoluteString pathComponents];
    if ([[pathComponents firstObject] rangeOfString:@"token="].location != NSNotFound) {
        NSRange range = [[pathComponents firstObject] rangeOfString:@"token="];
        NSString *token = [[pathComponents firstObject] substringFromIndex:range.location + range.length];
        NSLog(@"Acess Token:%@", token);
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"ACCESS_TOKEN"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [GRSession sharedInstance].instagramConnected = YES;
    }
    return YES;
}

@end
