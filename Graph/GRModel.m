//
//  GRModel.m
//  Graph
//
//  Created by Michael Scaria on 1/25/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRModel.h"

#import "AFNetworking.h"
#import "JSONKit.h"

@implementation GRModel

#define INSTAGRAM_CLIENT_ID @"65ef9fbdf51f46dfa0fe774590cc03f3"
#define INSTAGRAM_API_URL @"https://api.instagram.com/v1/"

+ (GRModel *)sharedInstance
{
    static GRModel *sharedInstance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[GRModel alloc] init];
    });
    
    return sharedInstance;
}

- (void)authorizeInstagram {
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/oauth/authorize/?client_id=%@&redirect_uri=graph://&response_type=200", INSTAGRAM_CLIENT_ID]]];
//    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
//    [request setHTTPMethod:@"GET"];
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSData *data = (NSData *)responseObject;
//        if (data){
//            NSArray *postsJSON = [[JSONDecoder decoder] objectWithData:data];
//            NSLog(@"postsJSON:%@", postsJSON);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//        if (failure) failure();
//    }];
//    [operation start];
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/oauth/authorize/?client_id=%@&redirect_uri=graph://&response_type=token", INSTAGRAM_CLIENT_ID]]];
    }
}

- (void)getSelf {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/users/29174454?access_token=%@",INSTAGRAM_API_URL,[[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"]]]];
    NSLog(@"URL:%@", [NSString stringWithFormat:@"%@/users/29174454?access_token=%@",INSTAGRAM_API_URL,[[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"]]);
    // Here you can handle response as well
    if (data) {
        NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"Response : %@",dictResponse);
    }
}
@end
