//
//  SQLTable.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>


#import "SQLCreation.h"
#import "SQLSelection.h"

#import "SQLColumn.h"

//#import "SQLConstraint.h"

@interface SQLTable : NSObject


/**
 表名

 @param table 表名
 @return 表
 */
+ (instancetype)table:(NSString *)table;



//- (SQLTable *(^)(NSString *))column;

//- (SQLTable *)unique;

@end


@interface SQLTable (Creation)

/**
 创建
 */
@property (nonatomic, strong, readonly)SQLCreation *create;

@end


@interface SQLTable (Select)

/**
 查询
 */
@property (nonatomic, strong, readonly)SQLSelection *select;

@end

