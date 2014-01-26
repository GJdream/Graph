//
//  Constants.h
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#ifndef Graph_Constants_h
#define Graph_Constants_h

typedef NS_ENUM(NSInteger, CELL_TYPE) {
    kNone,
    kAPI,
    kModel,
    kAction,
    kFrom,
    kFilter
};

typedef NS_ENUM(NSInteger, API_TYPE) {
    kNoAPI,
    kInstagram
};

typedef NS_ENUM(NSInteger, MODEL_TYPE) {
    kNoModel,
    kUsers,
    kPhotos,
    kComments
};

typedef NS_ENUM(NSInteger, ACTION_TYPE) {
    kNoAction,
    kLiked
};

typedef NS_ENUM(NSInteger, FROM_TYPE) {
    kNoOne,
    kFromPhotos
};

typedef NS_ENUM(NSInteger, FILTER_TYPE) {
    kNoFilter,
    kLocation
};

typedef NS_ENUM(NSInteger, RESULTS_TYPE) {
    kNoResults,
    kInstagramResults,
    kSnapchatResults
};

#define BORDER_INSET 12


#endif
