//
//  MainNavigationController.m
//  TestApp
//
//  Created by Admin on 31/01/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (NSUInteger)supportedInterfaceOrientations
{
    // return self.topViewController.supportedInterfaceOrientations;
    return UIInterfaceOrientationMaskPortrait;
}
//r
@end
