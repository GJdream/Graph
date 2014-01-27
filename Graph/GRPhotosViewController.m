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
        NSArray *array = @[@{@"name" : @"thisguyjayson", @"image" : @"j.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"emilymorgaan", @"image" : @"e.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"1katiebug234", @"image" : @"k.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"jerril_jacob", @"image" : @"jj.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"arturocardoso", @"image" : @"a.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"astrocuer", @"image" : @"ac.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"steviebear95", @"image" : @"sb.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"99manunited", @"image" : @"dd.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"deej_thearteest", @"image" : @"d.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"jwilso6k", @"image" : @"jw.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"sabrinaaahmed", @"image" : @"sa.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"roldyc", @"image" : @"r.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"kelsssmae", @"image" : @"ks.jpg", @"location" : @"Dallas, Texas"},
                   @{@"name" : @"colinyououtt", @"image" : @"ct.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"benbenny17", @"image" : @"bb.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"anthonytharp", @"image" : @"at.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"steffyninan", @"image" : @"sn.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"adimouse", @"image" : @"am.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"djabin_t", @"image" : @"dj.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"ggmathai45", @"image" : @"gma.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"roger_macias", @"image" : @"rg.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"nicole_taylor7", @"image" : @"nta.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"shelly_booth74", @"image" : @"sbt.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"lovesunshine13", @"image" : @"rme.jpg", @"location" : @"Santa Monica, California"},
                   @{@"name" : @"heyquayquay", @"image" : @"hqq.jpg", @"location" : @"Mountain View, California"},
                   @{@"name" : @"omgeezitsjenny", @"image" : @"omg.jpg", @"location" : @"Mountain View, California"},
                   @{@"name" : @"ashley13jo", @"image" : @"asl.jpg", @"location" : @"Mountain View, California"},
                   @{@"name" : @"rosa_raquel", @"image" : @"rsq.jpg", @"location" : @"Mountain View, California"},
                   @{@"name" : @"garek_ealey", @"image" : @"pper.jpg", @"location" : @"Mountain View, California"},
                   @{@"name" : @"halle24kate", @"image" : @"qwer.jpg", @"location" : @"Mountain View, California"}];
        
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
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"PhoneNumber"] isEqualToString:@"2402464945"]) {
            values = @[@{@"Name": @"Wajahat Siddiqui", @"Phone Number" : @"240-246-4945", @"Username" : @"agentwaj@gmail.com"}];
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
            number.text = @"240-246-4945";
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
        imageView.image = [UIImage imageNamed:dict[@"image"]];
        UILabel *label = (UILabel *)[cell viewWithTag:2];
        label.text = dict[@"name"];
    }
    
    return cell;
}


- (IBAction)done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
