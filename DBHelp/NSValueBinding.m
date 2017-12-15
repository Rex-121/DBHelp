//
//  NSValueBinding.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "NSValueBinding.h"

@implementation NSString (SQLBind)

- (NSString *)sqlType {
    return @"TEXT";
}

- (NSString *)sqlValue {
    return self;
}

- (NSString *(^)(eSQLBindType))sqlValueType {
    
    return ^(eSQLBindType type) {
        return @"TEXT";
    };
    
}

@end

@implementation NSNumber (SQLBind)

- (NSString *)sqlType {
    return @"REAL";
}

- (NSNumber *)sqlValue {
    return self;
}

- (NSString *(^)(eSQLBindType))sqlValueType {
    
    return ^(eSQLBindType type) {
        
        switch (type) {
            case eSQLBindTypeInt:
                return @"INT";
            case eSQLBindTypeBool:
                return @"INT";
            case eSQLBindTypeReal:
                return @"REAL";
            case eSQLBindTypeText:
                return @"TEXT";
        }
        
    };
    
}


@end


