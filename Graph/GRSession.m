//
//  GRSession.m
//  Graph
//
//  Created by Michael Scaria on 1/25/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRSession.h"

@implementation GRSession

+ (GRSession *)sharedInstance
{
    static GRSession *sharedInstance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[GRSession alloc] init];
    });
    
    return sharedInstance;
}

@end
