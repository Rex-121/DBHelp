//
//  SQLInsert.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/18.
//

#import "SQLExpression.h"

@interface SQLInsert : SQLExpression

+ (instancetype)insert:(NSString *)tableName;

/**
 需要插入的列(必须以 nil 结尾)
 */
- (SQLInsert *(^)(NSString *, ...))columns;


/**
 需要插入的列的值(必须以 nil 结尾)
 */
- (SQLInsert *(^)(id<SQLValueBinding>, ...))values;

@end
