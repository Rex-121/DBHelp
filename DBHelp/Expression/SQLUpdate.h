//
//  SQLUpdate.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/18.
//

#import "SQLExpression.h"

#import "SQLCondition.h"

@interface SQLUpdate : SQLExpression

+ (instancetype)update:(NSString *)tableName;

- (SQLUpdate *(^)(NSString *column, id<SQLValueBinding> value))set;

- (SQLWhere *(^)(NSString *column))where;

@end
