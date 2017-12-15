//
//  SQLSelection.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <DBHelp/SQLExpression.h>

@interface SQLSelection : SQLExpression


- (SQLSelection *(^)(NSString *))column;



@end
