//
//  SQLSelection.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLExpression.h"


@interface SQLSelection : SQLExpression<SQLSearchCondition>

+ (instancetype)select:(NSString *)tableName;

- (SQLSelection *(^)(NSString *))column;


@end

@interface SQLSelection (Count)

- (SQLSelection *)count;

@end

