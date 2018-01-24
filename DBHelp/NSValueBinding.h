//
//  NSValueBinding.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>

#import "SQLBinding.h"

#pragma mark - string

@interface NSString (SQLBind)<SQLValueBinding>

@end


#pragma mark - number

@interface NSNumber (SQLBind)<SQLValueBinding>


@end


#pragma mark - null

@interface NSNull (SQLBind)<SQLValueBinding>

@end



