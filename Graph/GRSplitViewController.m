//
//  GRSplitViewController.m
//  Graph
//
//  Created by Michael Scaria on 1/24/14.
//  Copyright (c) 2014 MichaelScaria. All rights reserved.
//


#import "GRSplitViewController.h"

#import "Constants.h"

#import "GRPhotosViewController.h"
#import "GRInstructionCell.h"


@interface GRSplitViewController ()

@end

@implementation GRSplitViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(instagramModal) name:@"Instagram" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(snapchatModal) name:@"Snapchat" object:nil];
    detailController = (GRViewController *)self.viewControllers[1];
    masterController = (GRInstructionTableViewController *)[[(UINavigationController *)self.viewControllers[0] childViewControllers] firstObject];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        [self instagramModal];
//    });
}

- (void)instagramModal {
    [masterController clear];
    [self performSegueWithIdentifier:@"Results" sender:@"Instagram"];
}

- (void)snapchatModal {
    [self performSegueWithIdentifier:@"Results" sender:@"Snapchat"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Results"]) {
        GRPhotosViewController *vc = (GRPhotosViewController *)segue.destinationViewController;
        if ([sender isEqualToString:@"Instagram"]) {
            vc.resultsType = kInstagramResults;
        }
        else {
            vc.resultsType = kSnapchatResults;

        }
    }
}

- (void)dragged:(UIPanGestureRecognizer *)recognizer {
    //HACK, still doesn't work properly
    apiRect = [detailController.apiBorder convertRect:detailController.apiBorder.bounds toView:self.view];
    modelRect = [detailController.modelBorder convertRect:detailController.modelBorder.bounds toView:self.view];
    actionRect = [detailController.actionBorder convertRect:detailController.actionBorder.bounds toView:self.view];
    fromRect = [detailController.fromBorder convertRect:detailController.fromBorder.bounds toView:self.view];
    CGPoint newPoint = [recognizer locationInView:self.view];
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        if (!selectedView) {
            selectedView = [[UIView alloc] initWithFrame:CGRectZero];
            selectedView.backgroundColor = [UIColor colorWithWhite:1 alpha:.7];
            logoView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 42, 42)];
            [selectedView addSubview:logoView];
            title = [[UILabel alloc] initWithFrame:CGRectMake(58, 8, 183, 21)];
            title.font = [UIFont systemFontOfSize:17];
            [selectedView addSubview:title];
            subtitle = [[UILabel alloc] initWithFrame:CGRectMake(58, 29, 239, 21)];
            subtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
            [selectedView addSubview:subtitle];
        }
        NSLog(@"Received a pan gesture");
        initialPoint = newPoint;
        selectedView.alpha = 1;
        selectedView.frame = [recognizer.view convertRect:recognizer.view.bounds toView:self.view];
        originalRect = selectedView.frame;
        logoView.image = [(UIImageView *)[recognizer.view viewWithTag:1] image];
        title.text = [(UILabel *)[recognizer.view viewWithTag:2] text];
        subtitle.text = [(UILabel *)[recognizer.view viewWithTag:3] text];
        [self.view addSubview:selectedView];

    }
    else if (recognizer.state == UIGestureRecognizerStateEnded) {
        BOOL apiIntersect = CGRectIntersectsRect(selectedView.frame, apiRect);
        BOOL modelIntersect = CGRectIntersectsRect(selectedView.frame, modelRect);
        BOOL actionIntersect = CGRectIntersectsRect(selectedView.frame, actionRect);
        BOOL fromIntersect = CGRectIntersectsRect(selectedView.frame, fromRect);
        if (apiIntersect || (modelIntersect && detailController.modelView.alpha == 1) || (actionIntersect && detailController.actionView.alpha == 1) || (fromIntersect && detailController.fromView.alpha == 1)) {
            CGPoint origin; CGSize size;//for selectedView animation
            CELL_TYPE section = kNone;
            if (apiIntersect) {
                section = kAPI;
                [detailController apiBorderMask:YES];
                origin = apiRect.origin;
                size = detailController.apiBorder.frame.size;
            }
            else if (modelIntersect) {
                section = kModel;
                [detailController modelBorderMask:YES];
                origin = modelRect.origin;
                size = detailController.modelBorder.frame.size;
            }
            else if (actionIntersect) {
                section = kAction;
                [detailController actionBorderMask:YES];
                origin = actionRect.origin;
                size = detailController.actionBorder.frame.size;
            }
            else if (fromIntersect) {
                section = kFrom;
                [detailController fromBorderMask:YES];
                origin = fromRect.origin;
                size = detailController.fromBorder.frame.size;
            }
            [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                selectedView.frame = CGRectMake(origin.x + BORDER_INSET/2, origin.y + BORDER_INSET/2, size.width - BORDER_INSET, size.height - BORDER_INSET);
                if ([(GRInstructionCell *)recognizer.view cellType] == kFilter) {
                    selectedView.alpha = 0;
                }
            } completion:^(BOOL completed) {
                [selectedView removeFromSuperview];
                [detailController addCell:(GRInstructionCell *)recognizer.view onSection:section];
                [masterController addCell:(GRInstructionCell *)recognizer.view];

            }];
        }

        else {
            [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                selectedView.frame = originalRect;
                selectedView.alpha = 0;
            } completion:^(BOOL finished) {
                [selectedView removeFromSuperview];
            }];
            [detailController apiBorderMask:NO];
            [detailController modelBorderMask:NO];
            [detailController actionBorderMask:NO];
            [detailController fromBorderMask:NO];
        }
    }
    else {
        float deltaX = newPoint.x-initialPoint.x;
        float deltaY = newPoint.y-initialPoint.y;
        selectedView.center = CGPointMake(selectedView.center.x + deltaX, selectedView.center.y + deltaY);
        [UIView animateWithDuration:.2 animations:^{
            if (CGRectIntersectsRect(selectedView.frame, apiRect)) {
                selectedView.frame = CGRectMake(selectedView.frame.origin.x, selectedView.frame.origin.y, detailController.apiBorder.frame.size.width - BORDER_INSET, detailController.apiBorder.frame.size.height - BORDER_INSET);
                if (!detailController.APIMaskON)[detailController apiBorderMask:YES];
                if (detailController.modelMaskON) [detailController modelBorderMask:NO];
                else if (detailController.actionMaskON) [detailController actionBorderMask:NO];
                else if (detailController.fromMaskON) [detailController fromBorderMask:NO];
            }
            else if (CGRectIntersectsRect(selectedView.frame, modelRect) && detailController.modelView.alpha == 1) {
                selectedView.frame = CGRectMake(selectedView.frame.origin.x, selectedView.frame.origin.y, detailController.modelBorder.frame.size.width - BORDER_INSET, detailController.modelBorder.frame.size.height - BORDER_INSET);
                if (!detailController.modelMaskON)[detailController modelBorderMask:YES];
                if (detailController.APIMaskON) [detailController apiBorderMask:NO];
                else if (detailController.actionMaskON) [detailController actionBorderMask:NO];
                else if (detailController.fromMaskON) [detailController fromBorderMask:NO];
            }
            else if (CGRectIntersectsRect(selectedView.frame, actionRect) && detailController.actionView.alpha == 1) {
                selectedView.frame = CGRectMake(selectedView.frame.origin.x, selectedView.frame.origin.y, detailController.actionBorder.frame.size.width - BORDER_INSET, detailController.actionBorder.frame.size.height - BORDER_INSET);
                if (!detailController.actionMaskON)[detailController actionBorderMask:YES];
                if (detailController.APIMaskON) [detailController apiBorderMask:NO];
                else if (detailController.modelMaskON) [detailController modelBorderMask:NO];
                else if (detailController.fromMaskON) [detailController fromBorderMask:NO];
            }
            else if (CGRectIntersectsRect(selectedView.frame, fromRect) && detailController.fromView.alpha == 1) {
                selectedView.frame = CGRectMake(selectedView.frame.origin.x, selectedView.frame.origin.y, detailController.fromBorder.frame.size.width - BORDER_INSET, detailController.fromBorder.frame.size.height - BORDER_INSET);
                if (!detailController.fromMaskON)[detailController fromBorderMask:YES];
                if (detailController.APIMaskON) [detailController apiBorderMask:NO];
                else if (detailController.modelMaskON) [detailController modelBorderMask:NO];
                else if (detailController.actionMaskON) [detailController actionBorderMask:NO];
            }
            else {
                [self turnOffMask];
                selectedView.frame = CGRectMake(selectedView.frame.origin.x, selectedView.frame.origin.y, originalRect.size.width, originalRect.size.height);
            }
        }completion:nil];
        
    }
    initialPoint = newPoint;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)turnOffMask {
    //TODO: figure out how to turn mask off when slide off
    if (detailController.APIMaskON) {
        [detailController apiBorderMask:NO];
    }
    else if (detailController.modelMaskON) {
        [detailController modelBorderMask:NO];

    }
    else if (detailController.actionMaskON) {
        [detailController actionBorderMask:NO];
    }
    else if (detailController.fromMaskON) {
        [detailController fromBorderMask:NO];
    }
}

//- (void)dragged:(UIPanGestureRecognizer *)recognizer {
//    CGPoint newPoint = [recognizer locationInView:self];
//    if (recognizer.state == UIGestureRecognizerStateBegan) {
//        NSLog(@"Received a pan gesture");
//        initialPoint = newPoint;
//        
//    }
//    else if (recognizer.state == UIGestureRecognizerStateEnded) {
//        float radius = self.frame.size.width/2;
//        float roundedCenter = self.center.x + 160;
//        float finalX;
//        float offset = 5;
//        if (roundedCenter > 320) {
//            //closer to the right side
//            finalX = 320 - radius;
//        }
//        else {
//            offset *= -1;
//            finalX = radius;
//        }
//        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            self.center = CGPointMake(finalX + offset, self.center.y);
//        }completion:^(BOOL finished) {
//            [UIView animateWithDuration:.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//                self.center = CGPointMake(finalX, self.center.y);
//            }completion:nil];
//        }];
//    }
//    else {
//        float radius = self.frame.size.width/2;
//        float finalX, finalY;
//        
//        float deltaX = newPoint.x-initialPoint.x;
//    }
//}

@end
