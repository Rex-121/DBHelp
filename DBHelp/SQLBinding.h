//
//  SQLBinding.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, eSQLBindType) {
    //值是一个带符号的整数，根据值的大小存储在 1、2、3、4、6 或 8 字节中。
    eSQLBindTypeInteger  = 0,
    //值是一个带符号的整数，根据值的大小存储在 1、2、3、4、6 或 8 字节中。
    eSQLBindTypeBool,
    //值是一个浮点值，存储为 8 字节的 IEEE 浮点数字。
    eSQLBindTypeReal,
    //值是一个文本字符串，使用数据库编码（UTF-8、UTF-16BE 或 UTF-16LE）存储
    eSQLBindTypeText,
    //值是一个 blob 数据，完全根据它的输入存储。
    eSQLBindTypeBlob,
};



@protocol SQLBinding <NSObject>

@end



@protocol SQLValueBinding<SQLBinding>

/** SQL 对应的类型 */
@property (nonatomic, strong, readonly)NSString *sqlType;

/** SQL 对应的值 */
@property (nonatomic, strong, readonly)NSString *sqlValue;

@optional

- (NSString *(^)(eSQLBindType type))sqlValueType;

@end






