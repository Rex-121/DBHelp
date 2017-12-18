//
//  SQLColumn.h
//  DBHelp
//
//  Created by Ray on 2017/12/17.
//

#import <Foundation/Foundation.h>

#import "SQLBinding.h"



@interface SQLColumn : NSObject


+ (instancetype)column:(NSString *)column;

+ (instancetype)creatColumn:(NSString *)column bind:(eSQLBindType)bind;

- (id)unique;


@end
