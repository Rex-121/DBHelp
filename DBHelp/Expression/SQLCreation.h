//
//  SQLCreation.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLExpression.h"

@interface SQLCreation : SQLExpression

+ (instancetype)creat:(NSString *)tableName;

/**
 字段名
 */
- (SQLCreation *(^)(NSString *column, eSQLBindType bind))column;


- (SQLColumn *(^)(NSString *column, eSQLBindType bind))newColumn;


- (SQLCreation *(^)(void))tableIfNotExits;

@end


@interface SQLAlter : SQLExpression

+ (instancetype)alter:(NSString *)tableName;

- (void (^)(NSString *newName))renameTo;

- (SQLColumn *(^)(NSString *column, eSQLBindType bind))addColumn;


@end
