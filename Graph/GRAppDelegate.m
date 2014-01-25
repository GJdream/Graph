//
//  GRAppDelegate.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRAppDelegate.h"

#import "GRModel.h"

#import "AFNetworking.h"
#import "JSONKit.h"

#define API_URL @"https://api.instagram.com/v1/"

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
    if ([[pathComponents firstObject] rangeOfString:@"token="].location != NSNotFound) {
        NSRange range = [[pathComponents firstObject] rangeOfString:@"token="];
        NSString *token = [[pathComponents firstObject] substringFromIndex:range.location + range.length];
        NSLog(@"%@", token);
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"ACCESS_TOKEN"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSData *data = (NSData *)responseObject;
//            if (data){
//                NSArray *postsJSON = [[JSONDecoder decoder] objectWithData:data];
//                NSLog(@"postsJSON:%@", postsJSON);
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//        }];
        
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/v1/users/self/media/liked?max_like_id=50&count=15&access_token=%@", code]]];
//        
//        NSError *error = nil; NSURLResponse *response = nil;
//        [request setValue:@"5f83d7bce196ba00a4addaf78244aab6" forHTTPHeaderField:@"X-CSRF-Token"];
//        [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//        if (error) {
//            NSLog(@"Error:%@", error.localizedDescription);
//        }
//        else {
//            NSLog(@"Response:%@", response.);
//        }
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/users/29174454?access_token=%@",API_URL,token]]];
        NSLog(@"URL:%@", [NSString stringWithFormat:@"%@/users/29174454?access_token=%@",API_URL,token]);
        // Here you can handle response as well
        if (data) {
            NSLog(@"D");
            NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response : %@",dictResponse);
        }
    }
    return YES;
}

@end
