//
//  User.h
//  BindDemo
//
//  Created by Vincent on 2017/3/13.
//  Copyright © 2017年 Vincent. All rights reserved.
//

#import "CommonModel.h"

@class Book;

@interface User : NSObject


@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic, strong) Book *book;

@end
