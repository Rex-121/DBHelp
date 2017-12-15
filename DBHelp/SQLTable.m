//
//  SQLTable.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLTable.h"

@interface SQLTable ()

/**  */
@property (nonatomic, copy)NSString *tableName;

/**  */
@property (nonatomic, strong)SQLCreation *creation;

/**  */
@property (nonatomic, assign)eSQLOperation operation;

@end

@implementation SQLTable

+ (instancetype)table:(NSString *)table {
    SQLTable *t = [SQLTable new];
    
    t.tableName = table;
    
    return t;
}


- (SQLCreation *)create {
    return self.creation;
}

- (SQLCreation *)creation {
    if (!_creation) {
        _creation = [SQLCreation new];
        _creation.table(_tableName);
        _operation = eSQLOperationCreate;
    }
    return _creation;
}

@end
