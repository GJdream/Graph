//
//  GRSnapchatModel.h
//  Graph
//
//  Created by Michael Scaria on 1/26/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Constants.h"

@interface GRSnapchatModel : NSObject

#pragma mark - Types
+ (MODEL_TYPE)modelTypeForIndexPath:(NSIndexPath *)indexPath;
+ (ACTION_TYPE)actionTypeForIndexPath:(NSIndexPath *)indexPath;
+ (FROM_TYPE)fromTypeForIndexPath:(NSIndexPath *)indexPath;
+ (FILTER_TYPE)filterTypeForIndexPath:(NSIndexPath *)indexPath;

#pragma mark - Counts
+ (NSArray *)models;
+ (NSArray *)actionsWithModelType:(MODEL_TYPE)modelType;
+ (NSArray *)fromsWithAction:(ACTION_TYPE)actionType modelType:(MODEL_TYPE)modelType;
+ (NSArray *)filtersWithFrom:(FROM_TYPE)fromType withAction:(ACTION_TYPE)actionType modelType:(MODEL_TYPE)modelType;

@end
