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


@property (nonatomic, strong)SQLCreation *creation;
@property (nonatomic, strong)SQLSelection *selection;

/**  */
@property (nonatomic, assign)eSQLOperation operation;

/** 最后一次指定的column */
@property (nonatomic, strong)SQLColumn *choosenColumn;

/**  */
@property (nonatomic, strong)NSMutableArray *columnArray;

@end

@implementation SQLTable

+ (instancetype)table:(NSString *)table {
    SQLTable *t = [SQLTable new];
    
    t.tableName = table;
    
    return t;
}

- (SQLTable *(^)(NSString *))column {
    return ^(NSString *c) {
        SQLColumn *co = [SQLColumn column:c];
        _choosenColumn = co;
        [self.columnArray addObject:co];
        return self;
    };
}





- (NSMutableArray *)columnArray {
    if (!_columnArray) {
        _columnArray = [NSMutableArray array];
    }
    return _columnArray;
}

- (SQLCreation *)creation {
    if (!_creation) {
        _creation = [SQLCreation creat:_tableName];
        _operation = eSQLOperationCreate;
    }
    return _creation;
}

- (SQLSelection *)selection {
    if (!_selection) {
        _selection = [SQLSelection select:_tableName];
        _operation = eSQLOperationSelect;
    }
    return _selection;
}

//- (SQLTable *)unique {
//    
//    
//    return self;
//}

@end


@implementation SQLTable (Creation)

- (SQLCreation *)create {
    return self.creation;
}



@end

@implementation SQLTable (Select)

- (SQLSelection *)select {
    return self.selection;
}
@end
