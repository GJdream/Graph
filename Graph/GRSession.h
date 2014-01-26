//
//  GRSession.h
//  Graph
//
//  Created by Michael Scaria on 1/25/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRSession : NSObject
@property (nonatomic, assign) BOOL instagramConnected;

+ (GRSession *)sharedInstance;
@end
