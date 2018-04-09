//
//  SQLOrderBy.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/27.
//

#import "SQLOrderBy.h"
@interface SQLOrderBy ()
/**  */
@property (nonatomic, strong)NSString *limitCount;

/**  */
@property (nonatomic, strong)NSString *sequenceString;

/**  */
@property (nonatomic, strong)NSString *offsetString;
@end

@implementation SQLOrderBy

+ (SQLOrderBy *)orderBY:(NSString *)table {
    return [SQLOrderBy expression:table];
}

- (SQLOrderBy *(^)(eSequence))sequence {
    
    return ^(eSequence s) {
        
        switch (s) {
            case eSequenceAscending:
                self.sequenceString = @"ASC";
                break;
            case eSequenceDescend:
                self.sequenceString = @"DESC";
                break;
        }
        
        return self;
    };
    
}

- (SQLOrderBy *(^)(NSInteger))limit {
    
    return ^(NSInteger l) {
        
        if (l > 0) {
            self.limitCount = [NSString stringWithFormat:@"%ld", (long)l];
        }
        
        return self;
    };
    
}


- (SQLOrderBy *(^)(NSInteger))offset {
    return ^(NSInteger o) {
        
        if (o > 0) {
            self.offsetString = [NSString stringWithFormat:@"%ld", (long)o];
        }
        
        return self;
    };
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
        
        if (!self.column) {
            return @"";
        }
        
        NSString *orderBy = [NSString stringWithFormat:@"ORDER BY %@", self.column.description];
        
        if (self.sequenceString.length) {
            orderBy = [orderBy stringByAppendingFormat:@" %@", self.sequenceString];
        }
        
        if (self.limitCount.length) {
            orderBy = [orderBy stringByAppendingFormat:@" LIMIT %@", self.limitCount];
        }
        
        if (self.offsetString.length) {
            orderBy = [orderBy stringByAppendingFormat:@" OFFSET %@;", self.offsetString];
        }
        
        
        return orderBy;
    };
}


@end
