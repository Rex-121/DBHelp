//
//  SQLSelection.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLSelection.h"

@interface SQLSelection()

/**  */
@property (nonatomic, strong)SQLWhere *sqlWhere;

@end

@implementation SQLSelection

- (SQLSelection *(^)(NSString *))column {
    return ^(NSString *c) {
      
        [self.columnArray addObject:c];
        
        return self;
    };
}


- (NSString *(^)(void))sqlExpression {
    
    return ^() {
        
        NSString *select = @"";
        
        if (self.columnArray.count) {
            select = [self.columnArray componentsJoinedByString:@", "];
        }
        else {
            select = @"*";
        }
        
        NSString *sql = [NSString stringWithFormat:@"SELECT %@ FROM %@", select, self.tableName];
        
        if (_sqlWhere) {
            return [sql stringByAppendingFormat:@" %@;", _sqlWhere.sqlExpression()];
        }
        
        return sql;
        
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

@end
