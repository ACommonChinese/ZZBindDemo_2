//
//  NSObject+LBModelDriven.h
//  BindModelDemo
//
//  Created by 刘威振 on 2017/3/7.
//  Copyright © 2017年 刘威振. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ZZModelDrivenDelegate <NSObject>

- (id)zz_getModel;
- (void)zz_willBind;
- (void)zz_afterBind;
@end


@interface NSObject (ZZModelDriven)

@property (nonatomic, copy, readonly) void (^autoBind)(UIView *view, NSString *viewProp, NSString *modelProp);

- (void)zz_bind;
@end
