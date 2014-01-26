//
//  GRSnapchatModel.m
//  Graph
//
//  Created by Michael Scaria on 1/26/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRSnapchatModel.h"

@implementation GRSnapchatModel

#pragma mark - Types
+ (MODEL_TYPE)modelTypeForIndexPath:(NSIndexPath *)indexPath
{
    MODEL_TYPE modelType;
    switch (indexPath.row) {
        case 0:
            modelType = kPhotos;
            break;
    }
    return modelType;
}

+ (ACTION_TYPE)actionTypeForIndexPath:(NSIndexPath *)indexPath
{
    ACTION_TYPE actionType;
    switch (indexPath.row) {
        case 0:
            actionType = kSent;
            break;
        case 1:
            actionType = kScreenshot;
            break;
    }
    return actionType;
}

+ (FROM_TYPE)fromTypeForIndexPath:(NSIndexPath *)indexPath
{
    FROM_TYPE fromType;
    switch (indexPath.row) {
        case 0:
            fromType = kMe;
            break;
    }
    return fromType;
}

+ (FILTER_TYPE)filterTypeForIndexPath:(NSIndexPath *)indexPath {
    FILTER_TYPE filterType;
    switch (indexPath.row) {
        case 0:
            filterType = kUsername;
            break;
    }
    return filterType;
}

#pragma mark - Counts
+ (NSArray *)models
{
    return @[@"Pictures"];
}

+ (NSArray *)actionsWithModelType:(MODEL_TYPE)modelType
{
    NSArray *actions;
    switch (modelType) {
        case kPhotos:
            actions = @[@"Sent", @"Screenshot"];
            break;
            
        default:
            break;
    }
    return actions;
}

+ (NSArray *)fromsWithAction:(ACTION_TYPE)actionType modelType:(MODEL_TYPE)modelType
{
    NSArray *froms;
    switch (modelType) {
            
        case kPhotos:
            
            switch (actionType) {
                case kSent:
                    froms = @[@"Me"];
                    break;
            }
            
            break;
    }
    return froms;
}

+ (NSArray *)filtersWithFrom:(FROM_TYPE)fromType withAction:(ACTION_TYPE)actionType modelType:(MODEL_TYPE)modelType
{
    NSArray *filters;
    switch (modelType) {
            
        case kPhotos:
            
            switch (actionType) {
                case kSent:
                    switch (fromType) {
                        case kMe:
                            filters = @[@"Username"];
                            break;
                    }
                    break;
            }
            
            break;
    }
    return filters;
    
}

@end
