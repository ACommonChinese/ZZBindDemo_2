//
//  ViewController.m
//  BindModelDemo
//
//  Created by 刘威振 on 2017/2/15.
//  Copyright © 2017年 刘威振. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ZZModelDriven.h"
#import "StudentModel.h"

@interface ViewController () <ZZModelDrivenDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *scoreField;
@property (weak, nonatomic) IBOutlet UITextField *keyboardNameField;

@property (nonatomic) StudentModel *student;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.student = [[StudentModel alloc] init];
    
    
    // usernameField.text -> self.student.username
    self.autoBind(self.usernameField, @"text", @"username");
    
    // passwordField.text -> self.student.password
    self.autoBind(self.passwordField, @"text", @"password");
    
    // scoreField.text -> self.student.score
    self.autoBind(self.scoreField, @"text", @"score");
    
    // keyboardNameField.text -> self.student.computer.keyboard.name
    self.autoBind(self.keyboardNameField, @"text", @"computer.keyboard.name");
}

- (IBAction)submit:(id)sender {
    [self zz_bind];
    [self.student printInfo];
}

- (void)zz_willBind {
    NSLog(@"WillBind");
}

- (void)zz_afterBind {
    NSLog(@"After Bind");
}

- (id)zz_getModel {
    return self.student;
}

@end
