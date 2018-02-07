//
//  Student.h
//  test
//
//  Created by lin on 2018/2/7.
//  Copyright © 2018年 biqinglin. All rights reserved.
//

#import "BQLModel.h"

#define bql_property(property) Student *(^property)(id value)

@interface Student : BQLModel

@property (nonatomic, copy, readonly) bql_property(name);
@property (nonatomic, copy, readonly) bql_property(age);
@property (nonatomic, copy, readonly) bql_property(sex);
@property (nonatomic, copy, readonly) bql_property(height);
@property (nonatomic, copy, readonly) bql_property(adult);

@end
