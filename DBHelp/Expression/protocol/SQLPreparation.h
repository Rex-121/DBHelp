//
//  SQLPreparation.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>

@protocol SQLPreparation <NSObject>


/**
 表名
 */
- (id (^)(NSString *table))table;


//- (id (^)(NSString *column))column;

/**
 sql 语句
 */
- (NSString *(^)(void))sqlExpression;

@end
