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
            [array addObject:obj.sqlExpression()];
        }
    }];
    
    return [array componentsJoinedByString:@", "];
    
}

- (NSUInteger)hash {
    return [self.name hash] & [self.tableName hash];
}

@end
