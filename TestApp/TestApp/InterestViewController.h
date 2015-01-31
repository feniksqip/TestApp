//
//  InterestViewController.h
//  TestApp
//
//  Created by Admin on 31/01/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InterestViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *var1;
@property (weak, nonatomic) IBOutlet UIButton *var2;
@property (weak, nonatomic) IBOutlet UIButton *var3;
- (IBAction)var1Action:(id)sender;
- (IBAction)var2Action:(id)sender;
- (IBAction)var3Action:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *msg1;
@property (weak, nonatomic) IBOutlet UIButton *msg2;
@property (weak, nonatomic) IBOutlet UIButton *msg3;
@property (weak, nonatomic) IBOutlet UIButton *msg4;
@property (weak, nonatomic) IBOutlet UIButton *msg5;
- (IBAction)msg1Action:(id)sender;
- (IBAction)msg2Action:(id)sender;
- (IBAction)msg3Action:(id)sender;
- (IBAction)msg4Action:(id)sender;
- (IBAction)msg5Action:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *msgTextField;

@property (nonatomic) NSNumber *buttonIndex;
@property (nonatomic) NSNumber *messageIndex;


- (IBAction)okBtnAction:(id)sender;

@end
