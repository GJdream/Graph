//
//  GRViewController.h
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *apiBorder;

- (void)apiBorderMask:(BOOL)enabled;
@end
