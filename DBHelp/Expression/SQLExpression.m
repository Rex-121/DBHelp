//
//  SQLExpression.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLExpression.h"


@interface SQLExpression()




@end

@implementation SQLExpression

         
+ (NSString *)transType:(eSQLBindType)type {
    
    switch (type) {
        case eSQLBindTypeText:
            return @"TEXT";
        case eSQLBindTypeInt:
            return @"INT";
        case eSQLBindTypeBool:
            return @"INT";
        case eSQLBindTypeReal:
            return @"REAL";
    }
    
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
        NSCAssert(NO, @"子类实现");
        return @"";
    };
}

- (id (^)(NSString *))table {
    return ^(NSString *t) {
        self.tableName = [t copy];
        return self;
    };
}

- (NSMutableArray *)columnArray {
    if (!_columnArray) {
        _columnArray = [NSMutableArray array];
    }
    return _columnArray;
}

- (id (^)(NSString *))column {
    return ^(NSString *c) {
        NSCAssert(NO, @"子类实现");
        return self;
    };
}


@end