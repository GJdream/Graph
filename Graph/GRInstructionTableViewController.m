//
//  GRInstructionTableViewController.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//

#import "GRInstructionTableViewController.h"

#import "GRInstagramModel.h"
#import "GRSnapchatModel.h"

#import "GRInstructionCell.h"


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
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        apiType = kInstagram;
//        filterLevel = 1;
//        [self.tableView reloadData];
//    });
}

- (void)addCell:(GRInstructionCell *)cell {
    if (cell.cellType == kAPI) {
        apiType = cell.apiType;
        filterLevel = 1;
        [self.tableView reloadData];
    }
    else if (cell.cellType == kModel) {
        modelType = cell.modelType;
        filterLevel = 2;
        [self.tableView reloadData];
        
    }
    else if (cell.cellType == kAction) {
        actionType = cell.actionType;
        filterLevel = 3;
        [self.tableView reloadData];
        
    }
    else if (cell.cellType == kFrom) {
        fromType = cell.fromType;
        filterLevel = 4;
        [self.tableView reloadData];
        
    }
}

#pragma mark - Model Cell Creation

- (void)makeModelCell:(GRInstructionCell *)cell cellType:(MODEL_TYPE)modelType {
    switch (modelType) {
        case kUsers:
            cell.modelType = kUsers;
            cell = [self makeUsersCell:cell];
            break;
        case kPhotos:
            cell.modelType = kPhotos;
            cell = [self makePhotosCell:cell];
            break;
        case kComments:
            cell.modelType = kComments;
            cell = [self makeCommentsCell:cell];
            break;
            
        default:
            break;
    }
}

- (GRInstructionCell *)makeUsersCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"users-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Users";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    subtitle.text = @"Search for users.";
    return cell;
}

- (GRInstructionCell *)makePhotosCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"photos-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Photos";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    if (cell.modelType == kPhotos) {
        subtitle.text = @"Search for photos.";
    }
    else {
        subtitle.text = @"Search from my photos.";
    }
    return cell;
}

- (GRInstructionCell *)makeCommentsCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"comments-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Comments";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    subtitle.text = @"Search for comments.";
    return cell;
}

#pragma mark - Action Cell Creation

- (void)makeActionCell:(GRInstructionCell *)cell cellType:(ACTION_TYPE)actionType {
    switch (actionType) {
        case kLiked:
            cell.actionType = kLiked;
            cell = [self makeLikeCell:cell];
            break;
        case kSent:
            cell.actionType = kSent;
            cell = [self makeSentCell:cell];
            break;
        case kScreenshot:
            cell.actionType = kScreenshot;
            cell = [self makeScreenshotCell:cell];
            break;
        default:
            break;
    }
}

- (GRInstructionCell *)makeLikeCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"like-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Like";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    subtitle.text = @"That has liked.";
    return cell;
}

- (GRInstructionCell *)makeSentCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"sent-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Sent";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    subtitle.text = @"That were sent.";
    return cell;
}

- (GRInstructionCell *)makeScreenshotCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"screenshot-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Screenshot";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    subtitle.text = @"That were saved.";
    return cell;
}



#pragma mark - From Cell Creation

- (void)makeFromCell:(GRInstructionCell *)cell cellType:(FROM_TYPE)fromType {
    switch (fromType) {
        case kFromPhotos:
            cell.fromType = kFromPhotos;
            cell = [self makePhotosCell:cell];
            break;
        case kMe:
            cell.fromType = kMe;
            cell = [self makeMeCell:cell];
            break;
            
        default:
            break;
    }
}
- (GRInstructionCell *)makeMeCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"me-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Me";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    subtitle.text = @"To me.";
    return cell;
}


#pragma mark - Filter Cell Creation

- (void)makeFilterCell:(GRInstructionCell *)cell cellType:(FILTER_TYPE)filterType {
    switch (filterType) {
        case kLocation:
            cell.filterType = kLocation;
            cell = [self makeLocationCell:cell];
            break;
        case kUsername:
            cell.filterType = kUsername;
            cell = [self makeUsernameCell:cell];
            break;
            
        default:
            break;
    }
}


- (GRInstructionCell *)makeLocationCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"location-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Location";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    subtitle.text = @"Filter with locations";
    return cell;
}

- (GRInstructionCell *)makeUsernameCell:(GRInstructionCell *)cell {
    UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
    logoView.image = [UIImage imageNamed:@"username-icon.png"];
    UILabel *title = (UILabel *)[cell viewWithTag:2];
    title.text = @"Username";
    UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
    subtitle.text = @"Filter with usernames.";
    return cell;
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
            rows = 2;
            break;
        case 1:
            if (apiType == kInstagram) {
                rows = [[GRInstagramModel models] count];
            }
            else if (apiType == kSnapchat) {
                rows = [[GRSnapchatModel models] count];
            }
            break;
        case 2:
            if (apiType == kInstagram) {
                rows = [[GRInstagramModel actionsWithModelType:modelType] count];
            }
            else if (apiType == kSnapchat) {
                rows = [[GRSnapchatModel actionsWithModelType:modelType] count];
            }
            break;
        case 3:
            if (apiType == kInstagram) {
                rows = [[GRInstagramModel fromsWithAction:actionType modelType:modelType] count];
            }
            else if (apiType == kSnapchat) {
                rows = [[GRSnapchatModel fromsWithAction:actionType modelType:modelType] count];
            }
            break;
        case 4:
            if (apiType == kInstagram) {
                rows = [[GRInstagramModel fromsWithAction:actionType modelType:modelType] count];
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
    
    // API's queriable
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
            logoView.image = [UIImage imageNamed:@"instagram-icon.png"];
            UILabel *title = (UILabel *)[cell viewWithTag:2];
            title.text = @"Instagram";
            UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
            subtitle.text = @"Capture and Share the World's Moments.";
            cell.apiType = kInstagram;
        }
        else if (indexPath.row == 1) {
            UIImageView *logoView = (UIImageView *)[cell viewWithTag:1];
            logoView.image = [UIImage imageNamed:@"snapchat-icon.png"];
            UILabel *title = (UILabel *)[cell viewWithTag:2];
            title.text = @"Snapchat";
            UILabel *subtitle = (UILabel *)[cell viewWithTag:3];
            subtitle.text = @"Experience a totally new way to share.";
            cell.apiType = kSnapchat;
        }
        cell.cellType = kAPI;
    }
    else if (indexPath.section == 1) {
        //models receivable
        if (apiType == kInstagram) {
            [self makeModelCell:cell cellType:[GRInstagramModel modelTypeForIndexPath:indexPath]];
        }
        else if (apiType == kSnapchat) {
            [self makeModelCell:cell cellType:[GRSnapchatModel modelTypeForIndexPath:indexPath]];
        }
        
        cell.cellType = kModel;
    }
    else if (indexPath.section == 2) {
        if (apiType == kInstagram) {
            [self makeActionCell:cell cellType:[GRInstagramModel actionTypeForIndexPath:indexPath]];
        }
        else if (apiType == kSnapchat) {
            [self makeActionCell:cell cellType:[GRSnapchatModel actionTypeForIndexPath:indexPath]];
        }
        
        cell.cellType = kAction;
    }
    else if (indexPath.section == 3) {
        if (apiType == kInstagram) {
            [self makeFromCell:cell cellType:[GRInstagramModel fromTypeForIndexPath:indexPath]];
        }
        else if (apiType == kSnapchat) {
            [self makeFromCell:cell cellType:[GRSnapchatModel fromTypeForIndexPath:indexPath]];
        }
        
        cell.cellType = kFrom;
    }
    else if (indexPath.section == 4) {
        if (apiType == kInstagram) {
            [self makeFilterCell:cell cellType:[GRInstagramModel filterTypeForIndexPath:indexPath]];
        }
        else if (apiType == kSnapchat) {
            [self makeFilterCell:cell cellType:[GRSnapchatModel filterTypeForIndexPath:indexPath]];
        }
        
        cell.cellType = kFilter;
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
        case 1:
            title = @"Models";
            break;
        case 2:
            title = @"Actions";
            break;
        case 3:
            title = apiType == kInstagram ? @"From" : @"To";
            break;
        case 4:
            title = @"Filter";
            break;
            
        default:
            break;
    }
    return title;
}

- (void)clear {
    apiType = nil;
    modelType = nil;
    actionType = nil;
    filterLevel = 0;
    [self.tableView reloadData];
}
@end
