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

#import "SQLPreparation.h"

@interface SQLExpression : NSObject<SQLPreparation>


+ (NSString *)transType:(eSQLBindType)type;


/** tableName */
@property (nonatomic, strong)NSString *tableName;

/** 存储 column */
@property (nonatomic, strong)NSMutableArray<NSString *> *columnArray;

@end
