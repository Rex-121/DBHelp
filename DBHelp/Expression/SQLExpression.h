//
//  SQLExpression.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>

#import "SQLSearchCondition.h"

typedef NS_ENUM(NSUInteger, eSQLOperation) {
    eSQLOperationSelect  =  0,
    eSQLOperationUpdate,
    eSQLOperationDelete,
    eSQLOperationCreate
};
#import "SQLBinding.h"

#import "SQLPreparation.h"

#import "SQLColumn.h"

@interface SQLExpression : NSObject<SQLPreparation>

+ (id)expression:(NSString *)tableName;

- (id)initWithTable:(NSString *)tableName;

/** tableName */
@property (nonatomic, strong)NSString *tableName;

/** 存储 column */
@property (nonatomic, strong)NSMutableArray<SQLColumn *> *columnArray;

- (SQLColumn *)columnExists:(SQLColumn *)column;

- (void)addColumnInQueue:(SQLColumn *)column;

@end


@interface SQLSearchExpression : SQLExpression <SQLSearchCondition>


/**  */
@property (nonatomic, strong)SQLWhere *sqlWhere;


@end
