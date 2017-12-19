//
//  SQLCreation.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLCreation.h"

@interface SQLCreation()

/**  */
@property (nonatomic, assign)BOOL ifTableExists;

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

- (SQLColumn *(^)(NSString *, eSQLBindType))newColumn {
    return ^(NSString *c, eSQLBindType t) {
        
//        if (c == NULL) {
//            return nil;
//        }

        SQLColumn *column = [SQLColumn creatColumn:c bind:t table:self.tableName];

        [self addColumnInQueue:column];
        
        return column;
    };
}



- (NSString* )creat {

    NSString *statementSql = [SQLColumn getSqlExpression:self.columnArray withBind:YES];
    
    NSString *exists = _ifTableExists ? @"IF NOT EXISTS" : @"";
    
    NSString *define = [NSString stringWithFormat:@"CREAT TABLE %@ %@ ( %@ );", exists, self.tableName, statementSql];
    
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

- (SQLCreation *(^)(void))tableIfNotExits {
    return ^() {
        self.ifTableExists = YES;
        return self;
    };
}

@end
