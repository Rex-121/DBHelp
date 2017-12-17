//
//  SQLColumn.m
//  DBHelp
//
//  Created by Ray on 2017/12/17.
//

#import "SQLColumn.h"


@interface SQLColumn()

/** columnName */
@property (nonatomic, strong)NSString *name;

@end

@implementation SQLColumn


+ (instancetype)column:(NSString *)column {
    
    SQLColumn *c = [SQLColumn new];
    c.name = column;

    return c;
}

- (NSString *)description {
    return self.name;
}


@end
