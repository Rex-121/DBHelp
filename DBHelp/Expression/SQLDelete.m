//
//  SQLDelete.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/21.
//

#import "SQLDelete.h"


@implementation SQLDelete

+ (id)deleteFrom:(NSString *)tableName {
    
    return [SQLDelete expression:tableName];
    
}

- (NSString *(^)(void))sqlExpression {
    
    return ^() {
      
        
        NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@", self.tableName];
        
        if (self.sqlWhere.isWhereWork) {
            return [sql stringByAppendingFormat:@" %@", self.sqlWhere.sqlExpression()];
        }
        return sql;
    };
    
    
}

@end
