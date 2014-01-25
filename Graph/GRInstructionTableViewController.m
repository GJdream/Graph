//
//  GRInstructionTableViewController.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRInstructionTableViewController.h"

#import "GRInstructionCell.h"

#define NUM_OF_INSTAGRAM_MODELS 3

@interface GRInstructionTableViewController ()

@end

@implementation GRInstructionTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)addCell:(GRInstructionCell *)cell {
    if (cell.cellType == kAPI) {
        apiType = cell.apiType;
        [self.tableView reloadData];
        filterLevel = 1;
    }
    else {
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return apiType == kNoAPI ? 1 : 1 + filterLevel;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rows = 1;
    switch (section) {
        case 0:
            rows = 1;
            break;
        case 1:
            if (apiType == kInstagram) {
                rows = NUM_OF_INSTAGRAM_MODELS;
            }
            break;
            
        default:
            rows = 0;
            break;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Instruction";
    GRInstructionCell *cell = (GRInstructionCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
            logoView.image = [UIImage imageNamed:@"instagram-logo.png"];
            UILabel *title = (UILabel *)[cell viewWithTag:2];
            title.text = @"Instagram";
            UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
            subtitle.text = @"Capture and Share the World's Moments.";
            cell.apiType = kInstagram;
        }
        cell.cellType = kAPI;
    }
    for (UIGestureRecognizer *g in cell.gestureRecognizers) {
        [cell removeGestureRecognizer:g];
    }
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.parentViewController.parentViewController action:@selector(dragged:)];
    [cell addGestureRecognizer:panGesture];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title;
    switch (section) {
        case 0:
            title = @"Networks";
            break;
            
        default:
            break;
    }
    return title;
}


@end
