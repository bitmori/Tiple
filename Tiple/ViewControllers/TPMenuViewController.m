//
//  TPMenuViewController.m
//  Tiple
//
//  Created by Ke Yang on 1/13/14.
//  Copyright (c) 2014 Pyrus. All rights reserved.
//

#import "TPMenuViewController.h"

@interface TPMenuViewController () <XDKAirMenuDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TPMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.airMenuController = [XDKAirMenuController sharedMenu];
    self.airMenuController.airDelegate = self;
    
    [self.view addSubview:self.airMenuController.view];
    [self addChildViewController:self.airMenuController];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"menuSegue"])
    {
        self.tableView = ((UITableViewController*)segue.destinationViewController).tableView;
    }
}


#pragma mark - XDKAirMenuDelegate

- (UIViewController*)airMenu:(XDKAirMenuController*)airMenu viewControllerAtIndexPath:(NSIndexPath*)indexPath
{
    UIViewController *vc = nil;
    
    if (indexPath.row == 0)
        vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mainViewController"];
    else if (indexPath.row == 1)
        vc = [self.storyboard instantiateViewControllerWithIdentifier:@"prefViewController"];

    vc.view.autoresizesSubviews = TRUE;
    vc.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    return vc;
}

- (UITableView*)tableViewForAirMenu:(XDKAirMenuController*)airMenu
{
    return self.tableView;
}

@end
