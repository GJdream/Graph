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
    kModel
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


#endif
