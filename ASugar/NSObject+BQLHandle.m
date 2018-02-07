//
//  NSObject+BQLHandle.m
//  test
//
//  Created by lin on 2018/2/2.
//  Copyright © 2018年 biqinglin. All rights reserved.
//

#import "NSObject+BQLHandle.h"
#import <objc/runtime.h>

@implementation NSObject (BQLHandle)

NSArray <NSString *>*getAllProperties(id class) {
    
    NSMutableArray <NSString *>*props = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([class class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        
        const char *char_f = property_getName(properties[i]);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        [props addObject:propertyName];
    }
    free(properties);
    return props;
}

@end
