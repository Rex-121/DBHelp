//
//  SQLSelection.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <DBHelp/SQLExpression.h>

#import "SQLCondition.h"

@interface SQLSelection : SQLExpression


- (SQLSelection *(^)(NSString *))column;

- (SQLWhere *(^)(NSString *column))where;

@end
