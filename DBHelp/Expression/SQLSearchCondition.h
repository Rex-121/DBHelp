//
//  SQLSearchCondition.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/21.
//

#import <Foundation/Foundation.h>

#import "SQLCondition.h"

@protocol SQLSearchCondition <NSObject>


- (SQLWhere *(^)(NSString *column))where;


@end
