//
//  SQLExpression.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, eSQLOperation) {
    eSQLOperationSelect  =  0,
    eSQLOperationUpdate,
    eSQLOperationDelete,
    eSQLOperationCreate
};
#import "SQLBinding.h"

@interface SQLExpression : NSObject



@end
