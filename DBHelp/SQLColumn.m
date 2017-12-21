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

/** 别名 */
@property (nonatomic, strong)NSString *alias;

/** bind */
@property (nonatomic, assign)eSQLBindType bind;

/** 是否是主键 */
@property (nonatomic, assign)BOOL isPrimaryKey;
/** 是否是唯一值 */
@property (nonatomic, assign)BOOL isUnique;
/** 是否 标记 不可为空 */
@property (nonatomic, assign)BOOL notNullAble;
/** 是否有默认值 */
@property (nonatomic, strong)id<SQLValueBinding>defaltV;

@end


@implementation SQLColumn


+ (instancetype)column:(NSString *)column table:(NSString *)table {
    
    SQLColumn *c = [SQLColumn new];
    c.name = column;
    c.tableName = table;
    return c;
}

+ (instancetype)column:(NSString *)column alias:(NSString *)alias table:(NSString *)table {
    SQLColumn *c = [self column:column table:table];
    if (alias != NULL && alias.length) {
        c.alias = alias;
    }
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
        case eSQLBindTypeInteger:
            return @"INTEGER";
        case eSQLBindTypeBool:
            return @"INTEGER";
        case eSQLBindTypeReal:
            return @"REAL";
        case eSQLBindTypeBlob:
            return @"BLOB";
    }
}

- (NSString *)description {
    
    if (_alias != NULL) {
        return [NSString stringWithFormat:@"%@ AS %@", self.name, _alias];
    }
    
    return self.name;
}


- (NSString *(^)(void))sqlExpression {
    return ^() {
        if (_value == nil) {
            return self.description;
        }
        return [NSString stringWithFormat:@"%@ = %@", self.name, self.value.sqlValue];
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
            [array addObject:obj.description];
        }
        else {
            
            NSString *sql = obj.valueDescription;
            
            if (obj.isPrimaryKey) {
                sql = [sql stringByAppendingString:@" PRIMARY KEY"];
            }
            else if (obj.isUnique) {
                sql = [sql stringByAppendingString:@" UNIQUE"];
            }
            
            if (obj.notNullAble) {
                sql = [sql stringByAppendingString:@" NOT NULL"];
            }
            if (obj.defaltV) {
                sql = [sql stringByAppendingFormat:@" DEFAULT %@", obj.defaltV.sqlValue];
            }
            
            [array addObject:sql];
        }
    }];
    
    return [array componentsJoinedByString:@", "];
    
}

- (NSString *)valueDescription {
    NSString *typeString = [SQLColumn transType:_bind];
    
    NSString *combi = [self.description stringByAppendingFormat:@" %@", typeString];
    
    return combi;
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
- (SQLColumn *(^)(id<SQLValueBinding>))defaultValue {
    return ^(id<SQLValueBinding>v) {
        self.defaltV = v;
        return self;
    };
}
@end
