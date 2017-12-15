//
//  SQLBinding.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, eSQLBindType) {
    eSQLBindTypeInt  = 0,
    eSQLBindTypeBool,
    eSQLBindTypeReal,
    eSQLBindTypeText,
};



@protocol SQLBinding <NSObject>



@end


@protocol SQLValueBinding<SQLBinding>

/** SQL 对应的类型 */
@property (nonatomic, strong, readonly)NSString *sqlType;

/** SQL 对应的值 */
@property (nonatomic, strong, readonly)id sqlValue;

@optional

- (NSString *(^)(eSQLBindType type))sqlValueType;

@end






