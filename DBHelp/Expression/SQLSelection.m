//
//  SQLSelection.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLSelection.h"

@implementation SQLSelection

- (SQLSelection *(^)(NSString *))column {
    return ^(NSString *c) {
      
        [self.columnArray addObject:c];
        
        return self;
    };
}


- (NSString *(^)(void))sqlExpression {
    
    return ^() {
        
        NSString *select = @"";
        
        if (self.columnArray.count) {
            select = [self.columnArray componentsJoinedByString:@", "];
        }
        else {
            select = @"*";
        }
        
        return [NSString stringWithFormat:@"SELECT %@ FROM %@", select, self.tableName];
        
    };
    
    
}

@end
