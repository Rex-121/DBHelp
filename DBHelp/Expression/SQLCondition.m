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

@end

@implementation SQLWhere


- (void (^)(id<SQLValueBinding>, id<SQLValueBinding>))between {
    return ^(id<SQLValueBinding>a, id<SQLValueBinding>b) {
      
        [self appendCondition:[NSString stringWithFormat:@"between %@ and %@", a.sqlValue, b.sqlValue]];
        
    };
}

- (void (^)(id<SQLValueBinding>))equal {
    return ^(id<SQLValueBinding>value) {
        [self appendCondition:[NSString stringWithFormat:@"= %@", value.sqlValue]];
    };
}

- (void (^)(NSString *, id<SQLValueBinding>))symbol {
    return ^(NSString *s, id<SQLValueBinding>value) {
        [self appendCondition:[NSString stringWithFormat:@"%@ %@", s, value.sqlValue]];
    };
}

- (void)setColumn:(NSString *)column {
    _column = column;
    
    self.sqlStatement = [NSString stringWithFormat:@"where %@", _column];
}

- (void)appendCondition:(NSString *)condition {
    self.sqlStatement = [self.sqlStatement stringByAppendingFormat:@" %@", condition];
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
        return self.sqlStatement.length ? self.sqlStatement : @"";
    };
}

- (id (^)(NSString *))table {
    return ^(NSString *z) {
        return @"";
    };
}

@end

