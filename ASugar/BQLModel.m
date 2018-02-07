//
//  BQLModel.m
//  test
//
//  Created by lin on 2018/2/2.
//  Copyright © 2018年 biqinglin. All rights reserved.
//

#import "BQLModel.h"
#import <objc/message.h>
#import <objc/message.h>

typedef BQLModel *(^BQLBlock)(id value);

static BQLBlock getter(id self, SEL _cmd) {
    NSString *getterName = NSStringFromSelector(_cmd);
    __weak BQLModel *weakSelf = self;
    return ^(id value) {
        //NSLog(@"%@ = %@",getterName,value);
        [weakSelf.all setValue:value forKey:getterName];
        return weakSelf;
    };
}

@implementation BQLModel

- (instancetype)init {
    
    if(self = [super init]) {
        
        Class c = self.class;
        _all = [NSMutableDictionary dictionary];
        
        [getAllProperties(self) enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [_all setValue:@"" forKey:obj];
            SEL originalSelector = NSSelectorFromString(obj);
            Method originalMethod = class_getInstanceMethod(c, originalSelector);
            IMP originalIMP = method_getImplementation(originalMethod);
            if (originalIMP) {
                const char *types = method_getTypeEncoding(originalMethod);
                class_addMethod(c, originalSelector, (IMP)getter, types);
                method_setImplementation(originalMethod, (IMP)getter);
            }
        }];
    }
    return self;
}

@end
