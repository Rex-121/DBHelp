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

        SQLColumn *column = [SQLColumn creatColumn:c bind:t table:self.tableName];

        [self addColumnInQueue:column];
        
        return column;
    };
}



- (NSString *)creat {

    NSString *statementSql = [SQLColumn getSqlExpression:self.columnArray withBind:YES];
    
    NSString *exists = _ifTableExists ? @"IF NOT EXISTS" : @"";
    
    if (exists.length) {
        return [NSString stringWithFormat:@"CREATE TABLE %@ %@ ( %@ );", exists, self.tableName, statementSql];
    }
    
    return [NSString stringWithFormat:@"CREATE TABLE %@ ( %@ );", self.tableName, statementSql];
    
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

@interface SQLAlter ()

/**  */
@property (nonatomic, strong)SQLColumn *column;

/**  */
@property (nonatomic, strong)NSString *reName;

@end


@implementation SQLAlter

+ (instancetype)alter:(NSString *)tableName {
    return [[SQLAlter alloc]initWithTable:tableName];
}

- (void (^)(NSString *))renameTo {
    return ^(NSString *r) {
        _reName = r;
    };
}

- (SQLColumn *(^)(NSString *, eSQLBindType))addColumn {
    return ^(NSString *c, eSQLBindType t) {
      
        self.column = [SQLColumn creatColumn:c bind:t table:self.tableName];
        
        return self.column;
    };
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
      
        NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ", self.tableName];
        if (_reName.length) {
            sql = [sql stringByAppendingFormat:@"RENAME TO %@", _reName];
        }
        
        if (self.column) {
            sql = [sql stringByAppendingFormat:@"ADD COLUMN %@", [SQLColumn sqlWithConstraintKey:self.column]];
        }
        return sql;
    };
}


@end
