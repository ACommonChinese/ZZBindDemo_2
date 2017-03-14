//
//  Book.h
//  BindDemo
//
//  Created by Vincent on 2017/3/13.
//  Copyright © 2017年 Vincent. All rights reserved.
//

#import "Author.h"

@interface Book : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) float price;
@property (nonatomic) Author *author;

@end
