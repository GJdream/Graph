//
//  GRInstructionTableViewController.h
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GRInstructionCell.h"

#import "Constants.h"
@interface GRInstructionTableViewController : UITableViewController {
    API_TYPE apiType;
    MODEL_TYPE modelType;
    ACTION_TYPE actionType;
    FROM_TYPE fromType;
    int filterLevel;
}
- (void)addCell:(GRInstructionCell *)cell;
- (void)clear;
@end
