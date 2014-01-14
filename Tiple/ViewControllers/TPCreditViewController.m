//
//  TPCreditViewController.m
//  Tiple
//
//  Created by Ke Yang on 1/13/14.
//  Copyright (c) 2014 Pyrus. All rights reserved.
//

#import "TPCreditViewController.h"

@interface TPCreditViewController ()

@end

@implementation TPCreditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:26.0/255.0 blue:26.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
