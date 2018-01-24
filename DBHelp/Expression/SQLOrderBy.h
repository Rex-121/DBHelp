//
//  SQLOrderBy.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/27.
//

#import "SQLExpression.h"

typedef NS_ENUM(NSUInteger, eSequence) {
    ///升序
    eSequenceAscending = 0,
    ///降序
    eSequenceDescend,
};

@interface SQLOrderBy : SQLExpression

+ (SQLOrderBy *)orderBY:(NSString *)table;

@property (nonatomic, strong)SQLColumn *column;

- (SQLOrderBy *(^)(eSequence))sequence;


- (SQLOrderBy *(^)(NSInteger index))offset;

- (SQLOrderBy *(^)(NSInteger limit))limit;

@end
