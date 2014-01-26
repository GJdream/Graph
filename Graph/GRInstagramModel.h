//
//  GRInstagramModel.h
//  Graph
//
//  Created by Michael Scaria on 1/25/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Constants.h"

@interface GRInstagramModel : NSObject

+ (BOOL)authorizeInstagram;

/*#pragma mark - Strings
+ (NSString *)modelForType:(MODEL_TYPE)modelType;
+ (NSString *)actionForType:(ACTION_TYPE)actionType;
+ (NSString *)fromForType:(FROM_TYPE)actionType;*/

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

#pragma mark - Queries
+ (void)queryWithModel:(MODEL_TYPE)modelType filters:(NSDictionary *)modelFilters action:(ACTION_TYPE)actionType filters:(NSDictionary *)actionFilters from:(FROM_TYPE)fromType filters:(NSDictionary *)fromFilters;
@end
