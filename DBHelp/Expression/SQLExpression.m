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

         


+ (instancetype)expression:(NSString *)tableName {
    SQLExpression *s = [SQLExpression new];
    s.tableName = tableName;
    return s;
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

- (NSMutableArray<SQLColumn *> *)columnArray {
    if (!_columnArray) {
        _columnArray = [NSMutableArray array];
    }
    return _columnArray;
}

- (id)initWithTable:(NSString *)tableName {
    self = [super init];
    if (self) {
        self.table(tableName);
    }
    return self;
}

- (BOOL)columnExists:(SQLColumn *)column {
    
    __block BOOL exist = NO;
    
    [self.columnArray enumerateObjectsUsingBlock:^(SQLColumn * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.hash == column.hash) {
            exist = YES;
            *stop = YES;
        }
    }];
    
    return exist;
}

- (void)addColumnInQueue:(SQLColumn *)column {
    if (![self columnExists:column]) {
        [self.columnArray addObject:column];
    }
}

@end
