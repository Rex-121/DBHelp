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


//- (NSString *(^)(void))creat;

@end
