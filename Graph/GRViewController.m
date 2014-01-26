//
//  GRViewController.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRViewController.h"

#import "GRSession.h"
#import "GRInstagramModel.h"


#define CORAL [UIColor colorWithRed:255/255.0 green:137/255.0 blue:128/255.0 alpha:1]

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
	// Do any additional setup after loading the view, typically from a nib.
    if ([GRSession sharedInstance].instagramConnected && apiType == kInstagram) {
        [self addModelBorder];
    }
    _modelView.alpha = _actionView.alpha = _fromView.alpha = 0;
//    [self addModelBorder];
}

- (UIImage *)maskedImageNamed:(NSString *)name color:(UIColor *)color
{
    UIImage *image = [UIImage imageNamed:name];
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
    CGContextRef c = UIGraphicsGetCurrentContext();
    [image drawInRect:rect];
    CGContextSetFillColorWithColor(c, [color CGColor]);
    CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
    CGContextFillRect(c, rect);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (void)apiBorderMask:(BOOL)enabled {
    _apiBorder.image = enabled ? [self maskedImageNamed:@"api-border.png" color:CORAL] : [UIImage imageNamed:@"api-border.png"];
}

- (void)modelBorderMask:(BOOL)enabled {
    _modelBorder.image = enabled ? [self maskedImageNamed:@"api-border.png" color:CORAL] : [UIImage imageNamed:@"api-border.png"];
}

- (void)actionBorderMask:(BOOL)enabled {
    _actionBorder.image = enabled ? [self maskedImageNamed:@"api-border.png" color:CORAL] : [UIImage imageNamed:@"api-border.png"];
}

- (void)fromBorderMask:(BOOL)enabled {
    _fromBorder.image = enabled ? [self maskedImageNamed:@"api-border.png" color:CORAL] : [UIImage imageNamed:@"api-border.png"];
}

- (void)addCell:(GRInstructionCell *)cell onSection:(CELL_TYPE)sectionType {
    if (cell.cellType == kAPI) {
        apiType = cell.apiType;
        if (apiType == kInstagram) {
            if ([GRInstagramModel authorizeInstagram]) [self addModelBorder];
        }
        if (!selectedAPIView) {
            selectedAPIView = [[UIView alloc] initWithFrame:CGRectMake(BORDER_INSET/2, BORDER_INSET/2, _apiBorder.frame.size.width - BORDER_INSET, _apiBorder.frame.size.height - BORDER_INSET)];
            selectedAPIView.backgroundColor = [UIColor colorWithWhite:1 alpha:.7];
            APILogoView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 42, 42)];
            [selectedAPIView addSubview:APILogoView];
            APITitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 8, 183, 21)];
            APITitle.font = [UIFont systemFontOfSize:17];
            [selectedAPIView addSubview:APITitle];
            APISubtitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 29, 239, 21)];
            APISubtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
            [selectedAPIView addSubview:APISubtitle];
        }
        APILogoView.image = [(UIImageView *)[cell viewWithTag:1] image];
        APITitle.text = [(UILabel *)[cell viewWithTag:2] text];
        APISubtitle.text = [(UILabel *)[cell viewWithTag:3] text];
        [_apiBorder addSubview:selectedAPIView];
        
    }
    else if (cell.cellType == kModel) {
        if (apiType == kInstagram) {
            model = cell.modelType;
            //TODO try to add filters here `filtersForModelType`
        }
        if (!selectedModelView) {
            selectedModelView = [[UIView alloc] initWithFrame:CGRectMake(BORDER_INSET/2, BORDER_INSET/2, _modelBorder.frame.size.width - BORDER_INSET, _modelBorder.frame.size.height - BORDER_INSET)];
            selectedModelView.backgroundColor = [UIColor colorWithWhite:1 alpha:.7];
            modelLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 42, 42)];
            [selectedModelView addSubview:modelLogoView];
            modelTitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 8, 183, 21)];
            APITitle.font = [UIFont systemFontOfSize:17];
            [selectedModelView addSubview:modelTitle];
            modelSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 29, 239, 21)];
            modelSubtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
            [selectedModelView addSubview:modelSubtitle];
        }
        modelLogoView.image = [(UIImageView *)[cell viewWithTag:1] image];
        modelTitle.text = [(UILabel *)[cell viewWithTag:2] text];
        modelSubtitle.text = [(UILabel *)[cell viewWithTag:3] text];
        [_modelBorder addSubview:selectedModelView];
        [self addActionBorder];
        
    }
    else if (cell.cellType == kAction){
        
        if (apiType == kInstagram) {
            action = cell.actionType;
        }
        if (!selectedActionView) {
            selectedActionView = [[UIView alloc] initWithFrame:CGRectMake(BORDER_INSET/2, BORDER_INSET/2, _modelBorder.frame.size.width - BORDER_INSET, _modelBorder.frame.size.height - BORDER_INSET)];
            selectedActionView.backgroundColor = [UIColor colorWithWhite:1 alpha:.7];
            actionLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 42, 42)];
            [selectedActionView addSubview:actionLogoView];
            actionTitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 8, 183, 21)];
            actionTitle.font = [UIFont systemFontOfSize:17];
            [selectedActionView addSubview:actionTitle];
            actionSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 29, 239, 21)];
            actionSubtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
            [selectedActionView addSubview:actionSubtitle];
        }
        actionLogoView.image = [(UIImageView *)[cell viewWithTag:1] image];
        actionTitle.text = [(UILabel *)[cell viewWithTag:2] text];
        actionSubtitle.text = [(UILabel *)[cell viewWithTag:3] text];
        [_actionBorder addSubview:selectedActionView];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 50);
        [self addFromBorder];
        [_scrollView scrollRectToVisible:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height) animated:YES];
    }
    else if (cell.cellType == kFrom) {
        
        if (apiType == kInstagram) {
            from = cell.fromType;
        }
        if (!selectedFromView) {
            selectedFromView = [[UIView alloc] initWithFrame:CGRectMake(BORDER_INSET/2, BORDER_INSET/2, _modelBorder.frame.size.width - BORDER_INSET, _modelBorder.frame.size.height - BORDER_INSET)];
            selectedFromView.backgroundColor = [UIColor colorWithWhite:1 alpha:.7];
            fromLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 42, 42)];
            [selectedFromView addSubview:fromLogoView];
            fromTitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 8, 183, 21)];
            fromTitle.font = [UIFont systemFontOfSize:17];
            [selectedFromView addSubview:fromTitle];
            fromSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 29, 239, 21)];
            fromSubtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
            [selectedFromView addSubview:fromSubtitle];
            fromFilterText = [[UILabel alloc] initWithFrame:CGRectMake(58, 52, 239, 21)];
            fromFilterText.text = @"";
            fromFilterText.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
            [selectedFromView addSubview:fromFilterText];
        }
        fromLogoView.image = [(UIImageView *)[cell viewWithTag:1] image];
        fromTitle.text = [(UILabel *)[cell viewWithTag:2] text];
        fromSubtitle.text = [(UILabel *)[cell viewWithTag:3] text];
        [_fromBorder addSubview:selectedFromView];
        
        
        //allow to query
        [self fromBorderMask:NO];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 210);
        
        lastLineLayer = [CAShapeLayer layer];
        [_fromView.layer addSublayer:lastLineLayer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(55, 215)];
        [path addLineToPoint:CGPointMake(606, 215)];
        [path stroke];
        
        UIColor *fill = [UIColor whiteColor];
        lastLineLayer.strokeStart = 0.0;
        lastLineLayer.strokeColor = fill.CGColor;
        lastLineLayer.lineWidth = 5.0;
        lastLineLayer.lineJoin = kCALineJoinMiter;
        lastLineLayer.lineDashPattern = @[@25,@9];
        lastLineLayer.lineDashPhase = 3.0f;
        lastLineLayer.path = path.CGPath;
        
        if (!button) {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button addTarget:self action:@selector(query) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = CORAL;
            button.layer.cornerRadius = 14;
            button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:30];
            [button setTitle:@"QUERY" forState:UIControlStateNormal];
            button.titleLabel.textColor = [UIColor whiteColor];
            button.frame = CGRectMake(0, 0, 322, 115);
            button.center = CGPointMake(_fromView.center.x, 310);
        }
        
        [_fromView addSubview:button];
        [_scrollView scrollRectToVisible:CGRectMake(0, 210, self.view.frame.size.width, self.view.frame.size.height) animated:YES];
    }
    else if (cell.cellType == kFilter) {
        if (sectionType == kAPI) {
            ;
        }
        else if (sectionType == kModel) {
            ;
        }
        else if (sectionType == kAction) {
            ;
        }
        else if (sectionType == kFrom) {
            if (cell.filterType == kLocation) {
                UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
                aiv.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
                aiv.center = [[UIApplication sharedApplication] keyWindow].center;
                [[[UIApplication sharedApplication] keyWindow] addSubview:aiv];
                [aiv startAnimating];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    [aiv stopAnimating];
                    [aiv removeFromSuperview];
                });
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter Location" message:@"Results will be filtered through location" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
                    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
                    alert.tag = kFrom;
                    [alert show];
                });
                
                
                
            }
            
        }
    }
}

- (IBAction)clear:(id)sender {
    apiType = nil; model = nil; action = nil; from = nil;
    [lastLineLayer removeFromSuperlayer];
    [button removeFromSuperview];
    _modelView.alpha = _actionView.alpha = _fromView.alpha = 0;
    _scrollView.contentSize = CGSizeZero;
    [selectedAPIView removeFromSuperview];
    [selectedModelView removeFromSuperview];
    [selectedActionView removeFromSuperview];
    [selectedFromView removeFromSuperview];
}

- (void)addModelBorder {
    _modelView.transform = CGAffineTransformMakeScale(.2, .2);
    [UIView animateWithDuration:.3 animations:^{
        _modelView.transform = CGAffineTransformIdentity;
    }completion:nil];
    _modelView.alpha = 1;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [_modelView.layer addSublayer:shapeLayer];
    [self addBorder:shapeLayer];
}

- (void)addActionBorder {
    _actionView.transform = CGAffineTransformMakeScale(.2, .2);
    [UIView animateWithDuration:.3 animations:^{
        _actionView.transform = CGAffineTransformIdentity;
    }completion:nil];
    _actionView.alpha = 1;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [_actionView.layer addSublayer:shapeLayer];
    [self addBorder:shapeLayer];
}

- (void)addFromBorder {
    _fromView.transform = CGAffineTransformMakeScale(.2, .2);
    [UIView animateWithDuration:.3 animations:^{
        _fromView.transform = CGAffineTransformIdentity;
    }completion:nil];
    _fromView.alpha = 1;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [_fromView.layer addSublayer:shapeLayer];
    [self addBorder:shapeLayer];
}

- (void)addBorder:(CAShapeLayer *)shapeLayer {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 10)];
    [path addLineToPoint:CGPointMake(703, 10)];
    [path stroke];
    
    UIColor *fill = [UIColor whiteColor];
    shapeLayer.strokeStart = 0.0;
    shapeLayer.strokeColor = fill.CGColor;
    shapeLayer.lineWidth = 5.0;
    shapeLayer.lineJoin = kCALineJoinMiter;
    shapeLayer.lineDashPattern = @[@25,@9];
    shapeLayer.lineDashPhase = 3.0f;
    shapeLayer.path = path.CGPath;
    
//    UIImageView *modelBorderView = [[UIImageView alloc] initWithFrame:CGRectMake(197, 310, 309, 118)];
//    modelBorderView.image = [UIImage imageNamed:@"api-border.png"];
//    [self.view addSubview:modelBorderView];
}

- (void)query {
    [GRInstagramModel queryWithModel:model filters:@{} action:action filters:@{} from:from filters:@{}];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .75 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self clear:nil];
    });
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSString *location = [(UITextField *)[alertView textFieldAtIndex:0] text];
    switch (alertView.tag) {
        case kFrom:
            fromFilterText.text = [NSString stringWithFormat:@"Filter:%@", location];
            break;

    }
}
@end
