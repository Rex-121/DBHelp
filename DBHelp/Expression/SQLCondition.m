//
//  SQLCondition.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLCondition.h"

//@implementation SQLCondition
//
//@end

@interface SQLWhere()

/**  */
@property (nonatomic, copy)NSString *sqlStatement;

/**  */
@property (nonatomic, assign)BOOL valueExists;

/**  */
@property (nonatomic, strong)SQLAndOrCondition *condition;


@end

@implementation SQLWhere

- (SQLAndOrCondition *)condition {
    if (!_condition) {
        _condition = [SQLAndOrCondition new];
    }
    return _condition;
}


- (id<SQLAndOrAddition> (^)(id<SQLValueBinding>, id<SQLValueBinding>))between {
    return ^(id<SQLValueBinding>a, id<SQLValueBinding>b) {
      
       return [self appendCondition:[NSString stringWithFormat:@"between %@ and %@", a.sqlValue, b.sqlValue]];
        
    };
}

- (id<SQLAndOrAddition> (^)(id<SQLValueBinding>))equal {
    return ^(id<SQLValueBinding>value) {
       return [self appendCondition:[NSString stringWithFormat:@"= %@", value.sqlValue]];
       
    };
}

- (id<SQLAndOrAddition> (^)(NSString *, id<SQLValueBinding>))symbol {
    return ^(NSString *s, id<SQLValueBinding>value) {
        return [self appendCondition:[NSString stringWithFormat:@"%@ %@", s, value.sqlValue]];
    };
}

- (id<SQLAndOrAddition>)inRange:(id<SQLValueBinding>)value, ... {
    
    va_list list;
    
    va_start(list, value);
    
    id<SQLAndOrAddition> z = [self inRangeWithList:list value:value];
    
    va_end(list);
    
    return z;
}

- (id<SQLAndOrAddition>)inRangeWithArray:(NSArray<id<SQLValueBinding>> *)array {
    
    NSMutableArray *a = [NSMutableArray array];
    
    for (id<SQLValueBinding>obj in array) {
        [a addObject:obj.sqlValue];
    }
    
    return [self appendCondition:[NSString stringWithFormat:@"IN (%@)", [a componentsJoinedByString:@", "]]];
}

- (id<SQLAndOrAddition>)inRangeWithList:(va_list)list value:(id<SQLValueBinding>)value {
    
    
    id obj;
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:value];
    
    while ((obj = va_arg(list, id))) {
        if ([obj conformsToProtocol:@protocol(SQLValueBinding)]) {
            id<SQLValueBinding>v = obj;
            [array addObject:v.sqlValue];
        }
    }
    
    return [self appendCondition:[NSString stringWithFormat:@"IN (%@)", [array componentsJoinedByString:@", "]]];
    
    
}


- (void)setColumn:(NSString *)column {
    _column = column;
    
    self.sqlStatement = [NSString stringWithFormat:@"where %@", _column];
}

- (id<SQLAndOrAddition>)appendCondition:(NSString *)condition {
    
    if (condition.length) {
        _valueExists = YES;
    }
    
    self.sqlStatement = [self.sqlStatement stringByAppendingFormat:@" %@", condition];
    
    return self.condition;
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
        
        if (self.condition.work) {
            return [self.sqlStatement stringByAppendingFormat:@"%@", self.condition.sqlExpression()];
        }
        
        
        return self.sqlStatement.length ? self.sqlStatement : @"";
    };
}

- (id (^)(NSString *))table {
    return ^(NSString *z) {
        return @"";
    };
}

- (BOOL)isWhereWork {
    
    return _valueExists && (_column.length > 0);
    
}

@end


@interface SQLAndOrCondition ()

/**  */
@property (nonatomic, strong)SQLWhere *sqlWhere;

@end


@implementation SQLAndOrCondition

- (SQLWhere *(^)(NSString *))andCondition {
    return ^(NSString *c) {
        self -> _isAndCondition = YES;
        self.sqlWhere.column = c;
        return self.sqlWhere;
    };
}

-(SQLWhere *)sqlWhere {
    if (!_sqlWhere) {
        _sqlWhere = [SQLWhere new];
    }
    return _sqlWhere;
}

- (SQLWhere *(^)(NSString *))orCondition {
    return ^(NSString *c) {
        self -> _isAndCondition = NO;
        self.sqlWhere.column = c;
        return self.sqlWhere;
    };
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
      
        if (_sqlWhere.isWhereWork) {
            
            NSString *condition = self.isAndCondition ? @"AND" : @"OR";
            
            NSString *sql = [_sqlWhere.sqlExpression() stringByReplacingOccurrencesOfString:@"where " withString:@""];
            
            return [NSString stringWithFormat:@" %@ %@", condition,  sql];
        }
        return @"";
    };
}

- (id (^)(NSString *))table {
    return ^(NSString *t) {
        return self;
    };
}

- (BOOL)work {
    return _sqlWhere.isWhereWork;
}

@end

