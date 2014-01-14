//
//  TPCreditViewController.m
//  Tiple
//
//  Created by Ke Yang on 1/13/14.
//  Copyright (c) 2014 Pyrus. All rights reserved.
//

#import "TPCreditViewController.h"
#import "TPRoundImageView.h"

@interface TPCreditViewController ()
@property (weak, nonatomic) IBOutlet TPRoundImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end

@implementation TPCreditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:26.0/255.0 blue:26.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.imageView setImage:[UIImage imageNamed:@"panda.png"]];
    UIColor *redColor = [UIColor colorWithRed:245.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1.0];
    UIColor *blueColor = [UIColor colorWithRed:0.0 green:168.0/255.0 blue:255.0/255.0 alpha:1.0];
    UIColor *greenColor = [UIColor colorWithRed:29.0/255.0 green:207.0/255.0 blue:0.0 alpha:1.0];
    
    [self.label1 setTextColor:greenColor];
    [self.label2 setTextColor:blueColor];
    [self.label3 setTextColor:redColor];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
