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
        case 1:
            modelType = kUsers;
            break;
    }
    return modelType;
}

+ (ACTION_TYPE)actionTypeForIndexPath:(NSIndexPath *)indexPath
{
    ACTION_TYPE actionType;
    switch (indexPath.row) {
        case 0:
            actionType = kBestFriend;
            break;
        case 1:
            actionType = kSent;
            break;
        case 2:
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
            filterType = kNumber;
            break;
    }
    return filterType;
}

#pragma mark - Counts
+ (NSArray *)models
{
    return @[@"Pictures", @"Users"];
}

+ (NSArray *)actionsWithModelType:(MODEL_TYPE)modelType
{
    NSArray *actions;
    switch (modelType) {
        case kPhotos:
            actions = @[@"Sent", @"Screenshot"];
            break;
            
        case kUsers:
            actions = @[@"Best Friend", @"Sent", @"Screenshot"];
            break;
    }
    return actions;
}

+ (NSArray *)fromsWithAction:(ACTION_TYPE)actionType modelType:(MODEL_TYPE)modelType
{
    NSArray *froms;
    switch (modelType) {
            
        case kUsers:
            
            switch (actionType) {
                case kBestFriend:
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
            
        case kUsers:
            
            switch (actionType) {
                case kBestFriend:
                    switch (fromType) {
                        case kMe:
                            filters = @[@"Number"];
                            break;
                    }
                    break;
            }
            
            break;
    }
    return filters;
    
}

@end
