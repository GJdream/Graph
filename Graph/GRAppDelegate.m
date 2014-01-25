//
//  GRAppDelegate.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRAppDelegate.h"

#import "GRModel.h"

@implementation GRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[GRModel sharedInstance] authorizeInstagram];
    return YES;
}
							
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSArray *pathComponents = [url.absoluteString pathComponents];
    NSLog(@"C:%@", pathComponents);
    return YES;
}

@end
