//
//  GRInstagramModel.m
//  Graph
//
//  Created by Michael Scaria on 1/25/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRInstagramModel.h"

#define INSTAGRAM_CLIENT_ID @"65ef9fbdf51f46dfa0fe774590cc03f3"
#define INSTAGRAM_API_URL @"https://api.instagram.com/v1/"

#define GEOCOD_KEY @"98e4a56ca46a7c8e36ceae5768d8d82ede5242e"

@implementation GRInstagramModel

+ (BOOL)authorizeInstagram
{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/oauth/authorize/?client_id=%@&redirect_uri=graph://&response_type=token", INSTAGRAM_CLIENT_ID]]];
        return NO;
    }
    return YES;
}

//+ (void)getSelf
//{
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/users/29174454?access_token=%@",INSTAGRAM_API_URL,[[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"]]]];
//    NSLog(@"URL:%@", [NSString stringWithFormat:@"%@/users/29174454?access_token=%@",INSTAGRAM_API_URL,[[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"]]);
//    // Here you can handle response as well
//    if (data) {
//        NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"Response : %@",dictResponse);
//    }
//}

+ (NSArray *)models
{
    return @[@"Users", @"Photos", @"Comments"];
}

/*+ (NSString *)modelForType:(MODEL_TYPE)modelType {
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
 */

+ (MODEL_TYPE)modelTypeForIndexPath:(NSIndexPath *)indexPath
{
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

+ (ACTION_TYPE)actionTypeForIndexPath:(NSIndexPath *)indexPath
{
    ACTION_TYPE actionType;
    switch (indexPath.row) {
        case 0:
            actionType = kLiked;
            break;
    }
    return actionType;
}

+ (FROM_TYPE)fromTypeForIndexPath:(NSIndexPath *)indexPath
{
    FROM_TYPE fromType;
    switch (indexPath.row) {
        case 0:
            fromType = kFromPhotos;
            break;
    }
    return fromType;
}

+ (FILTER_TYPE)filterTypeForIndexPath:(NSIndexPath *)indexPath {
    FILTER_TYPE filterType;
    switch (indexPath.row) {
        case 0:
            filterType = kLocation;
            break;
    }
    return filterType;
}

+ (NSArray *)actionsWithModelType:(MODEL_TYPE)modelType
{
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

+ (NSArray *)fromsWithAction:(ACTION_TYPE)actionType modelType:(MODEL_TYPE)modelType
{
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

+ (NSArray *)filtersWithFrom:(FROM_TYPE)fromType withAction:(ACTION_TYPE)actionType modelType:(MODEL_TYPE)modelType {
    NSArray *filters;
    switch (modelType) {
            
        case kUsers:
            
            switch (actionType) {
                case kLiked:
                    switch (fromType) {
                        case kFromPhotos:
                            filters = @[@"Location"];
                            break;
                    }
                    break;
            }
            
            break;
    }
    return filters;

}

+ (void)queryWithModel:(MODEL_TYPE)modelType filters:(NSDictionary *)modelFilters action:(ACTION_TYPE)actionType filters:(NSDictionary *)actionFilters from:(FROM_TYPE)fromType filters:(NSDictionary *)fromFilters
{
    //https://api.instagram.com/v1/media/search?lat=37.3894&lng=122.0819&distance=5000
    if (fromType == kFromPhotos) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Instagram" object:nil];
        });
    }
    
}
@end
