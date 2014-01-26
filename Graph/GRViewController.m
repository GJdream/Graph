//
//  GRViewController.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRViewController.h"

#import "GRModel.h"
#import "GRInstagramModel.h"


#define CORAL [UIColor colorWithRed:255/255.0 green:137/255.0 blue:128/255.0 alpha:1]

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
	// Do any additional setup after loading the view, typically from a nib.
    if ([GRModel sharedInstance].instagramConnected && apiType == kInstagram) {
        [self addModelBorder];
    }
    _modelView.alpha = _actionView.alpha = 0;
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

- (void)addCell:(GRInstructionCell *)cell {
    if (cell.cellType == kAPI) {
        apiType = cell.apiType;
        if (apiType == kInstagram) {
            if ([[GRModel sharedInstance] authorizeInstagram]) [self addModelBorder];
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
            model = [GRInstagramModel modelForType:cell.modelType];
            //TODO try to add filters here `filtersForModelType`
        }
        [self addActionBorder];
        
    }
    else if (cell.cellType == kAction){
        
        if (apiType == kInstagram) {
            action = [GRInstagramModel actionForType:cell.actionType];
        }
        
    }
}

- (void)addModelBorder {
    _modelView.transform = CGAffineTransformMakeScale(.2, .2);
    [UIView animateWithDuration:.3 animations:^{
        _modelView.transform = CGAffineTransformIdentity;
    }completion:nil];
    _modelView.alpha = 1;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [_modelView.layer addSublayer:shapeLayer];
    [self addBorder:shapeLayer offset:703];
}

- (void)addActionBorder {
    _actionView.transform = CGAffineTransformMakeScale(.2, .2);
    [UIView animateWithDuration:.3 animations:^{
        _actionView.transform = CGAffineTransformIdentity;
    }completion:nil];
    _actionView.alpha = 1;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [_actionView.layer addSublayer:shapeLayer];
    [self addBorder:shapeLayer offset:100];
}

- (void)addBorder:(CAShapeLayer *)shapeLayer offset:(int)deltaY {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 10)];
    [path addLineToPoint:CGPointMake(deltaY, 10)];
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

@end
