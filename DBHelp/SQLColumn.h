//
//  SQLColumn.h
//  DBHelp
//
//  Created by Ray on 2017/12/17.
//

#import <Foundation/Foundation.h>

@interface SQLColumn : NSObject


+ (instancetype)column:(NSString *)column;

- (SQLColumn *(^)(NSString *))add;

@end
