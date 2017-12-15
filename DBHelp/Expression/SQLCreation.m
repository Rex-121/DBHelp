//
//  SQLCreation.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLCreation.h"

@interface SQLCreation()



@end

@implementation SQLCreation


- (SQLCreation *(^)(NSString *))table {
    return ^(NSString *t) {
        self.tableName = t;
        return self;
    };
}

- (SQLCreation *(^)(NSString *, eSQLBindType))column {
    return ^(NSString *c, eSQLBindType t) {
        
        if (c == NULL) {
            return self;
        }
        
        NSString *typeString = [SQLExpression transType:t];
        
        NSString *combi = [c stringByAppendingFormat:@" %@", typeString];
        
        [self.columnArray addObject:combi];
        
        return self;
    };
}





- (NSString *(^)(void))creat {
    
    return ^() {
        
        NSString *statementSql = [self.columnArray componentsJoinedByString:@", "];
        
        NSString *define = [NSString stringWithFormat:@"CREAT TABLE %@ ( %@ );", self.tableName, statementSql];
        
        return define;
    };
    
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
        return self.creat();
    };
}

@end
