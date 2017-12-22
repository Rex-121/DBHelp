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

@class SQLWhere;
@protocol SQLAndOrAddition

- (SQLWhere *(^)(NSString *c))andCondition;

- (SQLWhere *(^)(NSString *c))orCondition;

@end

#pragma mark - -----------and  or------------

@interface SQLAndOrCondition : NSObject<SQLAndOrAddition, SQLPreparation>

/**  */
@property (nonatomic, assign, readonly)BOOL isAndCondition;

/**  */
@property (nonatomic, readonly)BOOL work;

@end

#pragma mark -----------------------



#pragma mark - SQL where


@interface SQLWhere : NSObject<SQLPreparation>

/** 查询的列表 */
@property (nonatomic, copy)NSString *column;


/**
 between and (在 之间的值)
 */
- (id<SQLAndOrAddition> (^)(id<SQLValueBinding> from, id<SQLValueBinding> to))between;


/**
 等于 value 的数据
 */
- (id<SQLAndOrAddition> (^)(id<SQLValueBinding> value))equal;

/**
 条件：列，比较运算符，值
 比较运算符包涵：= > < >= ,<=, !=,<> 表示（不等于）
 */
- (id<SQLAndOrAddition> (^)(NSString *symbol, id<SQLValueBinding> value))symbol;


- (id<SQLAndOrAddition>)inRange:(id<SQLValueBinding>)value, ... NS_REQUIRES_NIL_TERMINATION;

//- (id<SQLAndOrAddition>)inRange:(va_list)list;


/**
 是否是正常的sql语句

 @return 是否
 */
@property (nonatomic, assign, readonly)BOOL isWhereWork;

@end






