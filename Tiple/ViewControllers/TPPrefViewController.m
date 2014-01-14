//
//  TPPrefViewController.m
//  Tiple
//
//  Created by Ke Yang on 1/13/14.
//  Copyright (c) 2014 Pyrus. All rights reserved.
//

#import "TPPrefViewController.h"

@interface TPPrefViewController ()

- (IBAction)onMSControl:(id)sender;
- (IBAction)onResetButton:(id)sender;

@property (strong, nonatomic) SAMultisectorSector* percentSector;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel2;

@end

@implementation TPPrefViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:26.0/255.0 blue:26.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

    UIColor* perColor = [UIColor colorWithRed:29.0/255.0 green:207.0/255.0 blue:0.0 alpha:1.0];
    self.percentLabel.textColor = perColor;
    self.percentLabel2.textColor = perColor;
    
    self.percentSector = [SAMultisectorSector sectorWithColor:perColor maxValue:100.0];
    self.percentSector.position = 2;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"percentSet"]) {
        self.percentSector.startValue = [[NSUserDefaults standardUserDefaults] doubleForKey:@"percentLo"];
        self.percentSector.endValue = [[NSUserDefaults standardUserDefaults] doubleForKey:@"percentHi"];
    } else {
        self.percentSector.startValue = 0.0;
        self.percentSector.endValue = 100.0;
    }

    [self.msControl addSector:self.percentSector];
    [self updateDataView];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)onMSControl:(id)sender
{
    [self updateDataView];
}

- (IBAction)onResetButton:(id)sender
{
    self.percentSector.startValue = 0.0;
    self.percentSector.endValue = 100.0;
    [self updateDataView];
    [self.msControl setNeedsDisplay];
}

- (void)updateDataView
{
    [self.percentLabel setText:[NSString stringWithFormat:@"Min %.0f %%", round(self.percentSector.startValue)]];
    [self.percentLabel2 setText:[NSString stringWithFormat:@"Max %.0f %%", round(self.percentSector.endValue)]];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"percentSet"];
    [[NSUserDefaults standardUserDefaults] setDouble:self.percentSector.startValue forKey:@"percentLo"];
    [[NSUserDefaults standardUserDefaults] setDouble:self.percentSector.endValue forKey:@"percentHi"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
