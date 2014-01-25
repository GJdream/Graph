//
//  GRViewController.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRViewController.h"

#import "GRModel.h"


#define CORAL [UIColor colorWithRed:255/255.0 green:137/255.0 blue:128/255.0 alpha:1]

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    if ([GRModel sharedInstance].instagramConnected && apiType == kInstagram) {
//        [self addModelBorder];
    }
    [self addModelBorder];
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

- (void)addCell:(GRInstructionCell *)cell {
    if (cell.cellType == kAPI) {
        apiType = cell.apiType;
        if (apiType == kInstagram) {
            [[GRModel sharedInstance] authorizeInstagram];
        }
    }
    else {
        
    }
}

- (void)addModelBorder {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [_modelView.layer addSublayer:shapeLayer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    //draw a line
    [path moveToPoint:CGPointMake(0, 10)]; //add yourStartPoint here
    [path addLineToPoint:CGPointMake(703, 10)];// add yourEndPoint here
    [path stroke];
    
//    float dashPattern[] = {20,60,40,20}; //make your pattern here
//    [path setLineDash:dashPattern count:4 phase:3];
    
    UIColor *fill = [UIColor whiteColor];
    shapeLayer.strokeStart = 0.0;
    shapeLayer.strokeColor = fill.CGColor;
    shapeLayer.lineWidth = 5.0;
    shapeLayer.lineJoin = kCALineJoinMiter;
    shapeLayer.lineDashPattern = @[@20,@9];
    shapeLayer.lineDashPhase = 3.0f;
    shapeLayer.path = path.CGPath;
    
//    UIImageView *modelBorderView = [[UIImageView alloc] initWithFrame:CGRectMake(197, 310, 309, 118)];
//    modelBorderView.image = [UIImage imageNamed:@"api-border.png"];
//    [self.view addSubview:modelBorderView];
}

@end
