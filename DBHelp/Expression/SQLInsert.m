//
//  SQLInsert.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/18.
//

#import "SQLInsert.h"

#define INSERT_INTO @"INSERT INTO"
#define VALUES @"VALUES"

@interface SQLInsert ()

@property (nonatomic, strong)NSString *sqlValues;


@end

@implementation SQLInsert

+ (instancetype)insert:(NSString *)tableName {
    return [[SQLInsert alloc]initWithTable:tableName];
}

- (SQLInsert *(^)(NSString *, ...))columns {
    
    return ^(NSString *k, ...) {

        va_list list;
        
        
        
        if (k) {
            SQLColumn *first = [SQLColumn column:k table:self.tableName];
            [self addColumnInQueue:first];
            
            va_start(list, k);
            
            id argument;
            
            while ((argument = va_arg(list, id))) {
                if ([argument isKindOfClass:[NSString class]]) {
                    
                    SQLColumn *column = [SQLColumn column:argument table:self.tableName];
                    [self addColumnInQueue:column];
                }
            }
            
            va_end(list);
        }
        
        return self;
    };
    
}


- (SQLInsert *(^)(id<SQLValueBinding>, ...))values {
    return ^(id<SQLValueBinding>value, ...) {
      
        va_list list;
        
        if (value) {
            
            NSMutableArray<NSString *> *array = [NSMutableArray array];
            
            [array addObject:value.sqlValue];
            
            id sql;
            va_start(list, value);
            
            while ((sql = va_arg(list, id))) {
                if ([sql conformsToProtocol:@protocol(SQLValueBinding)]) {
                    id<SQLValueBinding>v = sql;
                    [array addObject:v.sqlValue];
                }
            }
            
            self->_sqlValues = [array componentsJoinedByString:@", "];
            
        }
        
        va_end(list);
    
        return self;
    };
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
        
        NSString *insert = [NSString stringWithFormat:@""INSERT_INTO" %@ ", self.tableName];
        
        NSString *values = [NSString stringWithFormat:@""VALUES" ( %@ );", self.sqlValues];
        
        if (self.columnArray.count) {
            return [insert stringByAppendingFormat:@"( %@ ) %@", [SQLColumn getSqlExpression:self.columnArray withBind:NO], values];
        }
        return [insert stringByAppendingFormat:@"%@", values];
    };
}

@end
