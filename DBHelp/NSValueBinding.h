//
//  NSValueBinding.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>

#import "SQLBinding.h"

@interface NSString (SQLBind)<SQLValueBinding>

//@property (nonatomic, strong, readonly)NSString *sqlValue;

@end

@interface NSNumber (SQLBind)<SQLValueBinding>


@end

@interface NSNull (SQLBind)<SQLValueBinding>

@end



