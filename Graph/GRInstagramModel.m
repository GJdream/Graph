//
//  GRInstagramModel.m
//  Graph
//
//  Created by Michael Scaria on 1/25/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRInstagramModel.h"

@implementation GRInstagramModel

+ (GRInstagramModel *)sharedInstance
{
    static GRInstagramModel *sharedInstance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[GRInstagramModel alloc] init];
    });
    
    return sharedInstance;
}

+ (NSArray *)models {
    return @[@"Users", @"Photos", @"Comments"];
}

+ (NSString *)modelForType:(MODEL_TYPE)modelType {
    NSString *model;
    switch (modelType) {
        case kUsers:
            model = @"Users";
            break;
        case kPhotos:
            model = @"Photos";
            break;
        case kComments:
            model = @"Comments";
            break;
            
        default:
            break;
    }
    return model;
}

+ (NSString *)actionForType:(ACTION_TYPE)actionType {
    NSString *action;
    switch (actionType) {
        case kLiked:
            action = @"Likes";
            break;
            
        default:
            break;
    }
    return action;
}

+ (NSString *)fromForType:(FROM_TYPE)fromType {
    NSString *from;
    switch (fromType) {
        case kFromPhotos:
            from = @"Photos";
            break;
            
        default:
            break;
    }
    return from;
}

+ (MODEL_TYPE)modelTypeForIndexPath:(NSIndexPath *)indexPath {
    MODEL_TYPE modelType;
    switch (indexPath.row) {
        case 0:
            modelType = kUsers;
            break;
        case 1:
            modelType = kPhotos;
            break;
        case 2:
            modelType = kComments;
            break;
    }
    return modelType;
}

+ (ACTION_TYPE)actionTypeForIndexPath:(NSIndexPath *)indexPath {
    ACTION_TYPE actionType;
    switch (indexPath.row) {
        case 0:
            actionType = kLiked;
            break;
    }
    return actionType;
}

+ (FROM_TYPE)fromTypeForIndexPath:(NSIndexPath *)indexPath {
    FROM_TYPE fromType;
    switch (indexPath.row) {
        case 0:
            fromType = kFromPhotos;
            break;
    }
    return fromType;
}

+ (NSArray *)actionsWithModelType:(MODEL_TYPE)modelType {
    NSArray *actions;
    switch (modelType) {
        case kUsers:
            actions = @[@"Like"];
            break;
            
        default:
            break;
    }
    return actions;
}

+ (NSArray *)fromsWithAction:(ACTION_TYPE)actionType modelType:(MODEL_TYPE)modelType {
    NSArray *froms;
    switch (modelType) {
            
        case kUsers:
            
            switch (actionType) {
                case kLiked:
                    froms = @[@"Photos"];
                    break;
            }
            
            break;
            

    }
    return froms;
}
@end
