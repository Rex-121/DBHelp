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

- (SQLCreation *(^)(NSString *, eSQLBindType))column {
    return ^(NSString *c, eSQLBindType t) {
        
        if (c == NULL) {
            return self;
        }
        
        SQLColumn *column = [SQLColumn creatColumn:c bind:t table:self.tableName];
        
        [self addColumnInQueue:column];
        
        return self;
    };
}





- (NSString* )creat {

        NSString *statementSql = [SQLColumn getSqlExpression:self.columnArray withBind:YES];
        
        NSString *define = [NSString stringWithFormat:@"CREAT TABLE %@ ( %@ );", self.tableName, statementSql];
        
        return define;
    
}

+ (instancetype)creat:(NSString *)tableName {
    return [[SQLCreation alloc]initWithTable:tableName];
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
        return [self creat];
    };
}

@end
