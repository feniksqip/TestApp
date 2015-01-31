//
//  InterestViewController.m
//  TestApp
//
//  Created by Admin on 31/01/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "InterestViewController.h"

@interface InterestViewController ()

@end

@implementation InterestViewController

@synthesize buttonIndex;

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.buttonIndex = [NSNumber numberWithInt:101];
    self.messageIndex = [NSNumber numberWithInt:201];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"BUTTON_INDEX"] != nil) {
        self.buttonIndex = [defaults objectForKey:@"BUTTON_INDEX"];
    }
    if ([defaults objectForKey:@"MESSAGE_INDEX"] != nil) {
        self.messageIndex = [defaults objectForKey:@"MESSAGE_INDEX"];
    }
    
    
    
    [self changeButtonStatus:self.buttonIndex];
    [self changeMessageStatus:self.messageIndex];
}

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
- (IBAction)exitSegueForModal:(UIStoryboardSegue *)segue
{
}
- (IBAction)var1Action:(id)sender {
    [self changeButtonStatus:[NSNumber numberWithInt:101]];
}

- (IBAction)var2Action:(id)sender {
    [self changeButtonStatus:[NSNumber numberWithInt:102]];
}

- (IBAction)var3Action:(id)sender {
    [self changeButtonStatus:[NSNumber numberWithInt:103]];
}

- (void) changeButtonStatus:(id)sender {
    NSNumber *select = (NSNumber*) sender;

    if ([select isEqualToNumber:[NSNumber numberWithInt:101]]) {
        buttonIndex = [NSNumber numberWithInt:101];
        self.var1.backgroundColor = [UIColor orangeColor];
        self.var2.backgroundColor = nil;
        self.var3.backgroundColor = nil;
    } else if ([select isEqualToNumber:[NSNumber numberWithInt:102]]) {
        buttonIndex = [NSNumber numberWithInt:102];
        self.var2.backgroundColor = [UIColor greenColor];
        self.var1.backgroundColor = nil;
        self.var3.backgroundColor = nil;
    } else if ([select isEqualToNumber:[NSNumber numberWithInt:103]]) {
        buttonIndex = [NSNumber numberWithInt:103];
        self.var3.backgroundColor = [UIColor redColor];
        self.var1.backgroundColor = nil;
        self.var2.backgroundColor = nil;
    }
}
- (void) changeMessageStatus:(id)sender {
    NSNumber *select = (NSNumber*) sender;
    
    if ([select isEqualToNumber:[NSNumber numberWithInt:201]]) {
        buttonIndex = [NSNumber numberWithInt:201];
        self.msg1.backgroundColor = [UIColor grayColor];
        self.msg2.backgroundColor = nil;
        self.msg3.backgroundColor = nil;
        self.msg4.backgroundColor = nil;
        self.msg5.backgroundColor = nil;
    } else if ([select isEqualToNumber:[NSNumber numberWithInt:202]]) {
        buttonIndex = [NSNumber numberWithInt:202];
        self.msg2.backgroundColor = [UIColor grayColor];
        self.msg1.backgroundColor = nil;
        self.msg3.backgroundColor = nil;
        self.msg4.backgroundColor = nil;
        self.msg5.backgroundColor = nil;
    } else if ([select isEqualToNumber:[NSNumber numberWithInt:203]]) {
        buttonIndex = [NSNumber numberWithInt:203];
        self.msg3.backgroundColor = [UIColor grayColor];
        self.msg1.backgroundColor = nil;
        self.msg2.backgroundColor = nil;
        self.msg4.backgroundColor = nil;
        self.msg5.backgroundColor = nil;
    } else if ([select isEqualToNumber:[NSNumber numberWithInt:204]]) {
        buttonIndex = [NSNumber numberWithInt:204];
        self.msg4.backgroundColor = [UIColor grayColor];
        self.msg1.backgroundColor = nil;
        self.msg2.backgroundColor = nil;
        self.msg3.backgroundColor = nil;
        self.msg5.backgroundColor = nil;
    } else if ([select isEqualToNumber:[NSNumber numberWithInt:205]]) {
        buttonIndex = [NSNumber numberWithInt:205];
        self.msg5.backgroundColor = [UIColor grayColor];
        self.msg1.backgroundColor = nil;
        self.msg2.backgroundColor = nil;
        self.msg3.backgroundColor = nil;
        self.msg4.backgroundColor = nil;
    }
    
}
- (IBAction)msg1Action:(id)sender {
    [self changeMessageStatus:[NSNumber numberWithInt:201]];
}

- (IBAction)msg2Action:(id)sender {
    [self changeMessageStatus:[NSNumber numberWithInt:202]];
}

- (IBAction)msg3Action:(id)sender {
    [self changeMessageStatus:[NSNumber numberWithInt:203]];
}

- (IBAction)msg4Action:(id)sender {
    [self changeMessageStatus:[NSNumber numberWithInt:204]];
}

- (IBAction)msg5Action:(id)sender {
    [self changeMessageStatus:[NSNumber numberWithInt:205]];
}
- (IBAction)okBtnAction:(id)sender {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.buttonIndex forKey:@"BUTTON_INDEX"];
    [defaults setObject:self.messageIndex forKey:@"MESSAGE_INDEX"];
    [defaults synchronize];
    
    NSLog(@"--- Data saved to UserDefaults ---");
}

@end
