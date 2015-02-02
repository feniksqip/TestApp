//
//  SelectedViewController.m
//  TestApp
//
//  Created by Admin on 31/01/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "SelectedViewController.h"

@interface SelectedViewController ()

@end

@implementation SelectedViewController

// GA
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"SelectedViewController";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //self.view.backgroundColor = [[UIColor class] performSelector:NSSelectorFromString([defaults objectForKey:@"COLOR"])] ;
  //  self.view.backgroundColor = (UIColor*) [defaults objectForKey:@"COLOR"];
    
    SEL selector = NSSelectorFromString([defaults objectForKey:@"COLOR"]);
    UIColor *color = [UIColor blackColor];
    if ([UIColor respondsToSelector:selector]) {
        color = [UIColor performSelector:selector];
    }
    self.view.backgroundColor = color;
    
    
    self.messageLabel.text = [defaults objectForKey:@"MESSAGE"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
  //  self.view.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//r
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}
//r

@end
