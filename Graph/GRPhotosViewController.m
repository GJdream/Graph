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
        NSArray *array = @[@{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Dallas, Texas"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Santa Monica, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Mountain View, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Mountain View, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Mountain View, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Mountain View, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Mountain View, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Mountain View, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Mountain View, California"},
                           @{@"name" : @"h", @"image" : @"h.jpg", @"location" : @"Mountain View, California"}];
        
        NSMutableArray *mValues = [[NSMutableArray alloc] initWithCapacity:values.count];
        
        for (NSDictionary *dict in array) {
            NSLog(@"%@", [[[NSUserDefaults standardUserDefaults] objectForKey:@"Location"] lowercaseString]);
            if ([[[[NSUserDefaults standardUserDefaults] objectForKey:@"Location"] lowercaseString] isEqualToString:[dict[@"location"] lowercaseString]]) {
                [mValues addObject:dict];
            }
        }
        values = (NSArray *)mValues;
        [_collectionView reloadData];

    }
    else {
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"PhoneNumber"] isEqualToString:@""] || YES) {
            values = @[@{@"Name": @"Wajahat Siddiqui", @"Phone Number" : @"", @"Username" : @"agentwaj@gmail.com"}];
            [_collectionView removeFromSuperview];
            
            UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(30, 90, 150, 21)];
            name.text = @"Wajahat Siddiqui";
            name.textColor = [UIColor blackColor];
            name.font = [UIFont systemFontOfSize:17];
            [self.view addSubview:name];
            
            UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(30, 115, 150, 21)];
            username.text = @"agentwaj@gmail.com";
            username.textColor = [UIColor blackColor];
            username.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
            [self.view addSubview:username];
            
            UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(30, 141, 150, 21)];
            number.text = @"123-456-7899";
            number.textColor = [UIColor blackColor];
            number.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
            [self.view addSubview:number];
            
            UIView *border = [[UIView alloc] initWithFrame:CGRectMake(10, 75, 180, 105)];
            border.layer.cornerRadius = 6;
            border.layer.borderColor = [UIColor blackColor].CGColor;
            border.layer.borderWidth = 4.0f;
            [self.view addSubview:border];
        }
        
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/users/29174454?access_token=%@",INSTAGRAM_API_URL,[[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"]]]];
//        NSLog(@"URL:%@", [NSString stringWithFormat:@"%@/users/29174454?access_token=",[[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"]]);
//        // Here you can handle response as well
//        if (data) {
//            NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            NSLog(@"Response : %@",dictResponse);
//        }
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
    NSDictionary *dict = values[indexPath.row];
    if (_resultsType == kInstagram) {
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:3];
        imageView.image = [UIImage imageNamed:@"instagram-icon.png"];
        UILabel *label = (UILabel *)[cell viewWithTag:2];
        label.text = dict[@"name"];
    }
    
    return cell;
}


- (IBAction)done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
