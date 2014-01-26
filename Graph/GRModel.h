//
//  GRModel.h
//  Graph
//
//  Created by Michael Scaria on 1/25/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRModel : NSObject

@property (nonatomic, assign) BOOL instagramConnected;

+ (GRModel *)sharedInstance;


#pragma mark - Instagram Queries
- (BOOL)authorizeInstagram;
- (void)getSelf;

@end
