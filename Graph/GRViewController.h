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
    NSString *model;
    NSString *action;
    
    //API View
    UIView *selectedAPIView;
    UIImageView *APILogoView;
    UILabel *APITitle;
    UILabel *APISubtitle;
    
    //Model View
    UIView *selectedModelView;
    UIImageView *modelLogoView;
    UILabel *modelTitle;
    UILabel *modelSubtitle;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *apiBorder;
@property (strong, nonatomic) IBOutlet UIView *modelView;
@property (strong, nonatomic) IBOutlet UIImageView *modelBorder;
@property (strong, nonatomic) IBOutlet UIView *actionView;
@property (strong, nonatomic) IBOutlet UIImageView *actionBorder;

- (void)apiBorderMask:(BOOL)enabled;
- (void)modelBorderMask:(BOOL)enabled;
- (void)addCell:(GRInstructionCell *)cell;
@end
