//
//  NSObject+LBAutoInstanceModel.m
//  BindDemo
//
//  Created by 刘威振 on 2017/3/14.
//  Copyright © 2017年 Vincent. All rights reserved.
//

#import "NSObject+LBAutoInstanceModel.h"
#import <objc/runtime.h>

//---------------------------------------------------------------------------------//
//                             LBProperty 属性类                                    //
//---------------------------------------------------------------------------------//

@interface LBProperty : NSObject

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *varName;

+ (instancetype)propWithAttributeStr:(NSString *)attribute;

@end

@implementation LBProperty

+ (instancetype)propWithAttributeStr:(NSString *)attribute {
    LBProperty *property     = [[LBProperty alloc] init];
    NSArray *component       = [attribute componentsSeparatedByString:@","];
    NSString *firstComponent = (NSString *)component.firstObject;
    NSString *lastComponent  = (NSString *)component.lastObject;
    if ([firstComponent hasPrefix:@"T@"]) {
        NSString *className  = [firstComponent substringWithRange:NSMakeRange(3, firstComponent.length-4)];
        if ([className isEqualToString:@"NSString"]) {
            return nil;
        }
        NSString *varName   = [lastComponent substringWithRange:NSMakeRange(2, lastComponent.length - 2)];
        property.className  = className;
        property.varName    = varName;
        return property;
    }
    return nil;
}

/**
 - (NSString *)description {
    return [NSString stringWithFormat:@"%@:%@", self.className, self.varName];
 }
 */

@end

//---------------------------------------------------------------------------------//
//                     NSObject category LBAutoInstanceModel                       //
//---------------------------------------------------------------------------------//

@implementation NSObject (LBAutoInstanceModel)

- (void)lb_autoInstance {
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    for (NSInteger i = 0; i < propertyCount; i++) {
        objc_property_t property = properties[i];
        const char *attribute = property_getAttributes(property);
        /**
         printf("%s\n", attribute);
         T@"NSString",C,N,V_name
         T@"NSString",C,N,V_age
         T@"Book",&,N,V_book
         Ti,N,V_testValue
         ...
         */
        LBProperty *prop = [LBProperty propWithAttributeStr:[NSString stringWithCString:attribute encoding:NSUTF8StringEncoding]];
        if (!prop || [self valueForKey:prop.varName] != nil) continue;
        Class cls = NSClassFromString(prop.className);
        id subObj = [[cls alloc] init];
        [subObj lb_autoInstance];
        [self setValue:subObj forKey:prop.varName];
    }
}

@end
