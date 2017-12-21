//
//  SQLSelection.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLSelection.h"

#import "SQLExpression+Where.h"

@interface SQLSelection()


/**  */
@property (nonatomic, assign)BOOL doCount;

@end

@implementation SQLSelection

- (SQLSelection *(^)(NSString *))column {
    return ^(NSString *c) {
      
         [self addColumnInQueue:[SQLColumn column:c table:self.tableName]];
        
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
        
        if (_doCount) {
            ///如果是统计数目
            sql = [NSString stringWithFormat:@"SELECT COUNT(%@) FROM %@", select, self.tableName];
        }
        else {
            sql = [NSString stringWithFormat:@"SELECT %@ FROM %@", select, self.tableName];
        }
        
        if (self.sqlWhere.isWhereWork) {
            return [sql stringByAppendingFormat:@" %@;", self.sqlWhere.sqlExpression()];
        }
        
        return sql;
        
    };
    
    
}

- (SQLWhere *(^)(NSString *))where {
    return ^(NSString *c) {
        self.sqlWhere.column = c;
        return self.sqlWhere;
    };
}

@end

@implementation SQLSelection (Count)

- (SQLSelection *)count {
    _doCount = YES;
    return self;
}

@end
