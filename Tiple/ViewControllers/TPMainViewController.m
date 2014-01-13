//
//  TPMainViewController.m
//  Tiple
//
//  Created by Ke Yang on 1/13/14.
//  Copyright (c) 2014 Pyrus. All rights reserved.
//

#import "TPMainViewController.h"
#import "XDKAirMenuController.h"

@interface TPMainViewController ()
- (IBAction)onMenuButton:(id)sender;

@end

@implementation TPMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onMenuButton:(id)sender
{
    XDKAirMenuController *menu = [XDKAirMenuController sharedMenu];
    
    if (menu.isMenuOpened)
        [menu closeMenuAnimated];
    else
        [menu openMenuAnimated];
}
@end
