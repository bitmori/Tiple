//
//  TPMainViewController.m
//  Tiple
//
//  Created by Ke Yang on 1/13/14.
//  Copyright (c) 2014 Pyrus. All rights reserved.
//

#import "TPMainViewController.h"

@interface TPMainViewController ()

- (IBAction)onMSControl:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelPriceHigh;
@property (weak, nonatomic) IBOutlet UILabel *labelTipLow;
@property (weak, nonatomic) IBOutlet UILabel *labelTipHigh;
@property (weak, nonatomic) IBOutlet UILabel *labelTotalLow;
@property (weak, nonatomic) IBOutlet UILabel *labelTotalHigh;

@property (strong, nonatomic) SAMultisectorSector* centSector;
@property (strong, nonatomic) SAMultisectorSector* dollarSector;
@property (strong, nonatomic) SAMultisectorSector* percentSector;

@end

@implementation TPMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:26.0/255.0 blue:26.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    UIColor *redColor = [UIColor colorWithRed:245.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1.0];
    UIColor *blueColor = [UIColor colorWithRed:0.0 green:168.0/255.0 blue:255.0/255.0 alpha:1.0];
    UIColor *greenColor = [UIColor colorWithRed:29.0/255.0 green:207.0/255.0 blue:0.0 alpha:1.0];
    
    self.centSector = [SAMultisectorSector sectorWithColor:redColor maxValue:100.0 label:@"¢"];
    self.dollarSector = [SAMultisectorSector sectorWithColor:blueColor maxValue:99.0 label:@"$"];
    self.percentSector = [SAMultisectorSector sectorWithColor:greenColor maxValue:100.0];
    
    self.centSector.endValue = 26.0;
    self.dollarSector.endValue = 13.0;
    
//    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"percentSet"]) {
//        self.percentSector.minValue = [[NSUserDefaults standardUserDefaults] doubleForKey:@"percentLo"];
//        self.percentSector.maxValue = [[NSUserDefaults standardUserDefaults] doubleForKey:@"percentHi"];
//    } else {
//        self.percentSector.minValue = 0.0;
//    }
    self.percentSector.startValue = 15.0;
    self.percentSector.endValue = 20.0;
    
    [self.msControl addSector:self.centSector];
    [self.msControl addSector:self.dollarSector];
    [self.msControl addSector:self.percentSector];
    
    [self updateDataView];
}

- (void)updateDataView
{
    int percentLo = round(self.percentSector.startValue);
    int percentHi = round(self.percentSector.endValue);
    double price = round(self.centSector.endValue)/100.0+round(self.dollarSector.endValue);
    double tipLo = price * percentLo/100.0;
    double tipHi = price * percentHi/100.0;
    double totalLo = price + tipLo;
    double totalHi = price + tipHi;
    [self.labelPriceHigh setText:[NSString stringWithFormat:@"%.2f", price]];
    [self.labelTipLow setText:[NSString stringWithFormat:@"%.2f", tipLo]];
    [self.labelTipHigh setText:[NSString stringWithFormat:@"%.2f", tipHi]];
    [self.labelTotalLow setText:[NSString stringWithFormat:@"%.2f", totalLo]];
    [self.labelTotalHigh setText:[NSString stringWithFormat:@"%.2f", totalHi]];
}


- (IBAction)onMSControl:(id)sender
{
    [self updateDataView];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
