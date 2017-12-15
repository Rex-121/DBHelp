//
//  SQLCondition.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>

//@interface SQLCondition : NSObject
//
//
//
//@end

#import "SQLBinding.h"
#import "SQLPreparation.h"

@interface SQLWhere : NSObject<SQLPreparation>

/** 查询的列表 */
@property (nonatomic, copy)NSString *column;


/**
 between and (在 之间的值)
 */
- (void (^)(id<SQLValueBinding> from, id<SQLValueBinding> to))between;


/**
 等于 value 的数据
 */
- (void (^)(id<SQLValueBinding> value))equal;

/**
 条件：列，比较运算符，值
 比较运算符包涵：= > < >= ,<=, !=,<> 表示（不等于）
 */
- (void (^)(NSString *symbol, id<SQLValueBinding> value))symbol;

@end
