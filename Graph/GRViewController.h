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
    MODEL_TYPE model;
    ACTION_TYPE action;
    FROM_TYPE from;

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
    
    //Action View
    UIView *selectedActionView;
    UIImageView *actionLogoView;
    UILabel *actionTitle;
    UILabel *actionSubtitle;
    
    //From View
    UIView *selectedFromView;
    UIImageView *fromLogoView;
    UILabel *fromTitle;
    UILabel *fromSubtitle;
    CAShapeLayer *lastLineLayer;
    UIButton *button;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *apiBorder;
@property (strong, nonatomic) IBOutlet UIView *modelView;
@property (strong, nonatomic) IBOutlet UIImageView *modelBorder;
@property (strong, nonatomic) IBOutlet UIView *actionView;
@property (strong, nonatomic) IBOutlet UIImageView *actionBorder;
@property (strong, nonatomic) IBOutlet UIView *fromView;
@property (strong, nonatomic) IBOutlet UIImageView *fromBorder;

- (void)apiBorderMask:(BOOL)enabled;
- (void)modelBorderMask:(BOOL)enabled;
- (void)actionBorderMask:(BOOL)enabled;
- (void)fromBorderMask:(BOOL)enabled;
- (void)addCell:(GRInstructionCell *)cell;
- (IBAction)clear:(id)sender;
@end
