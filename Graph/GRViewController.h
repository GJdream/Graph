//
//  GRViewController.h
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Constants.h"

#import "GRInstructionCell.h"

@interface GRViewController : UIViewController {
    API_TYPE apiType;
}

@property (strong, nonatomic) IBOutlet UIImageView *apiBorder;
@property (strong, nonatomic) IBOutlet UIView *modelView;
@property (strong, nonatomic) IBOutlet UIImageView *modelBorder;

- (void)apiBorderMask:(BOOL)enabled;
- (void)addCell:(GRInstructionCell *)cell;
@end
