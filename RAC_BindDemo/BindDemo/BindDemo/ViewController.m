//
//  ViewController.m
//  BindDemo
//
//  Created by Vincent on 2017/3/13.
//  Copyright © 2017年 Vincent. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "Book.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "NSObject+LBAutoInstanceModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UITextField *bookField;
@property (weak, nonatomic) IBOutlet UITextField *authorNameField;
@property (weak, nonatomic) IBOutlet UITextField *authorAgeField;

@property (nonatomic) User *user;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindModel];
}

- (void) bindModel {
    RAC(self.user, name) = self.userField.rac_textSignal;
    RAC(self.user, age)  = self.pwdField.rac_textSignal;
    RAC(self.user.book, name) = self.bookField.rac_textSignal;
    RAC(self.user.book.author, name) = self.authorNameField.rac_textSignal;
    RAC(self.user.book.author, age) = self.authorAgeField.rac_textSignal;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"\n user_name -> %@   \n use_age -> %ld  \n book_name -> %@  \n author_name -> %@  \n author_age -> %f",self.user.name, self.user.age ,self.user.book.name, self.user.book.author.name, self.user.book.author.age);
}

- (User *)user {
    if (!_user) {
        _user = [[User alloc] init];
        [_user lb_autoInstance];
    }
    return _user;
}


@end
