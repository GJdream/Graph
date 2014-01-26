//
//  GRPhotosViewController.m
//  Graph
//
//  Created by Michael Scaria on 1/26/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRPhotosViewController.h"

#import "UIImageView+AFNetworking.h"

@interface GRPhotosViewController ()

@end

@implementation GRPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_resultsType == kInstagramResults) {
        values = @[@{@"name" : @"thisguyjayson", @"image" : @"j.jpg"},
                   @{@"name" : @"emilymorgaan", @"image" : @"e.jpg"},
                   @{@"name" : @"1katiebug234", @"image" : @"k.jpg"},
                   @{@"name" : @"jerril_jacob", @"image" : @"jj.jpg"},
                   @{@"name" : @"arturocardoso", @"image" : @"a.jpg"},
                   @{@"name" : @"astrocuer", @"image" : @"ac.jpg"},
                   @{@"name" : @"steviebear95", @"image" : @"sb.jpg"},
                   @{@"name" : @"99manunited", @"image" : @"dd.jpg"},
                   @{@"name" : @"deej_thearteest", @"image" : @"d.jpg"},
                   @{@"name" : @"jwilso6k", @"image" : @"jw.jpg"},
                   @{@"name" : @"sabrinaaahmed", @"image" : @"sa.jpg"},
                   @{@"name" : @"roldyc", @"image" : @"r.jpg"},
                   @{@"name" : @"kelsssmae", @"image" : @"ks.jpg"},
                   @{@"name" : @"colinyououtt", @"image" : @"ct.jpg"},
                   @{@"name" : @"benbenny17", @"image" : @"bb.jpg"},
                   @{@"name" : @"anthonytharp", @"image" : @"at.jpg"},
                   @{@"name" : @"steffyninan", @"image" : @"sn.jpg"},
                   @{@"name" : @"adimouse", @"image" : @"am.jpg"},
                   @{@"name" : @"djabin_t", @"image" : @"dj.jpg"},
                   @{@"name" : @"ggmathai45", @"image" : @"gma.jpg"}];
        [_collectionView reloadData];

    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return values.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"Photo" forIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor clearColor]];
    NSDictionary *dict = values[indexPath.row];
//    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/280px-PNG_transparency_demonstration_1.png"]];
//    imageView.image = [UIImage imageWithData:data];
//    [imageView setImageWithURL:[NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/280px-PNG_transparency_demonstration_1.png"]];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:3];
    imageView.image = [UIImage imageNamed:dict[@"image"]];
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.text = dict[@"name"];
    
    return cell;
}


- (IBAction)done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
