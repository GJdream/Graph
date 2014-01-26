//
//  GRInstructionCell.h
//  Graph
//
//  Created by Michael Scaria on 1/25/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface GRInstructionCell : UITableViewCell

@property (nonatomic, assign) CELL_TYPE cellType;
@property (nonatomic, assign) API_TYPE apiType;
@property (nonatomic, assign) MODEL_TYPE modelType;
@property (nonatomic, assign) ACTION_TYPE actionType;
@property (nonatomic, assign) FROM_TYPE fromType;
@end
