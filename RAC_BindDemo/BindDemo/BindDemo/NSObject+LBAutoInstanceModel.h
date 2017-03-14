//
//  NSObject+LBAutoInstanceModel.h
//  BindDemo
//
//  Created by 刘威振 on 2017/3/14.
//  Copyright © 2017年 Vincent. All rights reserved.
//

/**
 * 在RAC绑定模型的示例中，如果模型含多层嵌套的情况，确保中间对象不为空
 */

#import <Foundation/Foundation.h>

@interface NSObject (LBAutoInstanceModel)

- (void)lb_autoInstance;

@end
