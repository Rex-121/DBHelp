//
//  SQLSelection.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLSelection.h"


@interface SQLSelection()


/**  */
@property (nonatomic, assign)BOOL doCount;

/** column as 别名 */
@property (nonatomic, strong)NSString *asColumn;

@property (nonatomic, strong)SQLOrderBy *orderByLimit;

@end

@implementation SQLSelection

- (SQLOrderBy *)orderByLimit {
    if (!_orderByLimit) {
        _orderByLimit = [SQLOrderBy orderBY:self.tableName];
    }
    return _orderByLimit;
}

- (SQLSelection *(^)(NSString *))column {
    return ^(NSString *c) {
      
         [self addColumnInQueue:[SQLColumn column:c table:self.tableName]];
        
        return self;
    };
}

- (SQLSelection *(^)(NSString *, NSString *))columnAsAlias {
    return ^(NSString *c, NSString *a) {
        [self addColumnInQueue:[SQLColumn column:c alias:a table:self.tableName]];
        return self;
    };
}

+ (instancetype)select:(NSString *)tableName {
    return [[SQLSelection alloc]initWithTable:tableName];
}


- (NSString *(^)(void))sqlExpression {
    
    return ^() {
        
        NSString *select = @"";
        
        if (self.columnArray.count) {
            select = [SQLColumn getSqlExpression:self.columnArray withBind:NO];
        }
        else {
            select = @"*";
        }
        
        NSString *sql = @"";
        
        if (self->_doCount) {
            ///如果是统计数目
            sql = [NSString stringWithFormat:@"SELECT COUNT(%@) FROM %@", select, self.tableName];
        }
        else {
            sql = [NSString stringWithFormat:@"SELECT %@ FROM %@", select, self.tableName];
        }
        
        if (self.sqlWhere.isWhereWork) {
            sql = [sql stringByAppendingFormat:@" %@", self.sqlWhere.sqlExpression()];
        }
        
        if (self.orderByLimit) {
            sql = [sql stringByAppendingFormat:@" %@", self.orderByLimit.sqlExpression()];
        }
        
        return sql;
        
    };
    
    
}



@end

@implementation SQLSelection (Count)

- (SQLSelection *)count {
    _doCount = YES;
    return self;
}



@end

@implementation SQLSelection (OrderBy)
- (SQLOrderBy *(^)(NSString *))orderBy {
    
    return ^(NSString *c) {
        self.orderByLimit.column = [SQLColumn column:c table:self.tableName];
        return self.orderByLimit;
    };
    
}
@end
