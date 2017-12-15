//
//  SQLTable.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>
#import "SQLCreation.h"
@interface SQLTable : NSObject


/**
 表名

 @param table 表名
 @return 表
 */
+ (instancetype)table:(NSString *)table;


/**  */
@property (nonatomic, strong, readonly)SQLCreation *create;

@end
