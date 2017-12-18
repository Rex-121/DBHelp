//
//  SQLUpdate.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/18.
//

#import "SQLUpdate.h"

@interface SQLUpdate()


@property (nonatomic, strong)SQLWhere *sqlWhere;
@end

@implementation SQLUpdate

+ (instancetype)update:(NSString *)tableName {
    return [[SQLUpdate alloc]initWithTable:tableName];
}

- (SQLUpdate *(^)(NSString *, id<SQLValueBinding>))set {
    return ^(NSString *c, id<SQLValueBinding> v) {
        
        SQLColumn *column = [SQLColumn column:c table:self.tableName];
        
        ///如果列是一样 值不一样， 取最新值
        if ([self columnExists:column]) {
            column = [self columnExists:column];
        }
        
        column.value = v;
        
        [self addColumnInQueue:column];
        
        return self;
    };
}

-(SQLWhere *)sqlWhere {
    if (!_sqlWhere) {
        _sqlWhere = [SQLWhere new];
    }
    return _sqlWhere;
}


- (SQLWhere *(^)(NSString *))where {
    return ^(NSString *c) {
        self.sqlWhere.column = c;
        return self.sqlWhere;
    };
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
      
        NSMutableArray *array = [NSMutableArray array];
        
        [self.columnArray enumerateObjectsUsingBlock:^(SQLColumn * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array addObject:obj.valueDescription];
        }];
        
        NSString *update = [NSString stringWithFormat:@"UPDATE %@ SET %@", self.tableName, [array componentsJoinedByString:@", "]];
        
        if (_sqlWhere) {
            return [update stringByAppendingFormat:@" %@", _sqlWhere.sqlExpression()];
        }

        return update;
        
    };
}

@end
