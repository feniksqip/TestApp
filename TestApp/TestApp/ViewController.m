//
//  ViewController.m
//  TestApp
//
//  Created by Admin on 28/01/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    //r
    BOOL canRotateToAllOrientations;
    //r
}

@end

@implementation ViewController

//r
//- (IBAction)exitSegueForModal:(UIStoryboardSegue *)segue
//{
//}
- (void) viewDidAppear:(BOOL)animated
{
    //  [super viewDidAppear:animated];
    
    //	We're now on the screen, reenable auto rotations
    canRotateToAllOrientations = NO; // was YES
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //	(iOS 5)
    //	If we can auto rotate then only all orientations except upside down
    if(canRotateToAllOrientations)
        return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    //	Otherwise only allow our forced orienation (see below)
    return (toInterfaceOrientation == self.preferredInterfaceOrientationForPresentation);
}
- (BOOL) shouldAutorotate
{
    //	(iOS 6)
    //	Only auto rotate if we're on the screen (see above)
    return canRotateToAllOrientations;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    //	(iOS 6)
    //	Prefer (force) landscape
    return UIInterfaceOrientationPortrait;
}
//r

// GA
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Main Controller";
    //r
    //	We're going onto the screen, disable auto rotations
    canRotateToAllOrientations = NO;
    //r
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
