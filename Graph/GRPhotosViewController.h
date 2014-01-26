//
//  GRPhotosViewController.h
//  Graph
//
//  Created by Michael Scaria on 1/26/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Constants.h"

@interface GRPhotosViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {
    NSArray *values;
    
}
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign) RESULTS_TYPE resultsType;

- (IBAction)done:(id)sender;
@end
