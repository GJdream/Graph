//
//  GRSplitViewController.h
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GRViewController.h"
#import "GRInstructionTableViewController.h"

@interface GRSplitViewController : UISplitViewController {
    UIView *selectedView;
    UIImageView *logoView;
    UILabel *title;
    UILabel *subtitle;
    CGRect originalRect;
    CGPoint initialPoint;
    
    GRViewController *detailController;
    GRInstructionTableViewController *masterController;
    
    CGRect apiRect;
    CGRect modelRect;
}

@end
