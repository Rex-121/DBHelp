//
//  SQLColumn.m
//  DBHelp
//
//  Created by Ray on 2017/12/17.
//

#import "SQLColumn.h"


@interface SQLColumn()

/**  */
@property (nonatomic, strong)NSString *tableName;

/** columnName */
@property (nonatomic, strong)NSString *name;

/** bind */
@property (nonatomic, assign)eSQLBindType bind;

/** 是否是主键 */
@property (nonatomic, assign)BOOL isPrimaryKey;
/** 是否是唯一值 */
@property (nonatomic, assign)BOOL isUnique;
/** 是否 标记 不可为空 */
@property (nonatomic, assign)BOOL notNullAble;
@end


@implementation SQLColumn


+ (instancetype)column:(NSString *)column table:(NSString *)table {
    
    SQLColumn *c = [SQLColumn new];
    c.name = column;
    c.tableName = table;
    return c;
}

+ (instancetype)creatColumn:(NSString *)column bind:(eSQLBindType)bind table:(NSString *)table {
    SQLColumn *c = [self column:column table:table];
    c.bind = bind;
    return c;
}

+ (NSString *)transType:(eSQLBindType)type {
    
    switch (type) {
        case eSQLBindTypeText:
            return @"TEXT";
        case eSQLBindTypeInt:
            return @"INT";
        case eSQLBindTypeBool:
            return @"INT";
        case eSQLBindTypeReal:
            return @"REAL";
    }
}

- (NSString *)description {
    return self.name;
}


- (NSString *(^)(void))sqlExpression {
    return ^() {
        NSString *typeString = [SQLColumn transType:_bind];
        
        NSString *combi = [self.description stringByAppendingFormat:@" %@", typeString];
        
        return combi;
    };
}

- (id (^)(NSString *))table {
    return ^(NSString *t) {
        _tableName = t;
        return self;
    };
}

+ (NSString *)getSqlExpression:(NSArray<SQLColumn *> *)columnSet withBind:(BOOL)withBind {
    
    
    
    NSMutableArray *array = [NSMutableArray array];
    
    [columnSet enumerateObjectsUsingBlock:^(SQLColumn * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!withBind) {
            [array addObject:obj.name];
        }
        else {
            
            NSString *sql = obj.sqlExpression();
            
            if (obj.isPrimaryKey) {
                sql = [sql stringByAppendingString:@" PRIMARY KEY"];
            }
            else if (obj.isUnique) {
                sql = [sql stringByAppendingString:@" UNIQUE"];
            }
            
            if (obj.notNullAble) {
                sql = [sql stringByAppendingString:@" NOT NULL"];
            }
            
            [array addObject:sql];
        }
    }];
    
    return [array componentsJoinedByString:@", "];
    
}

- (NSString *)valueDescription {
    if (_value == nil) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@ = %@", self.name, self.value.sqlValue];
}

- (NSUInteger)hash {
    return [self.name hash] & [self.tableName hash];
}

@end


@implementation SQLColumn (Constraint)


- (SQLColumn *(^)(void))notNull {
    return ^() {
        self.notNullAble = YES;
        return self;
    };
}

- (SQLColumn *(^)(void))primaryKey {
    return ^() {
        self.isPrimaryKey = YES;
        
        return self;
    };
}

- (SQLColumn *(^)(void))unique {
    return ^() {
        self.isUnique = YES;
        return self;
    };
}

@end
