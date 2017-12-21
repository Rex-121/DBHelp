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
@property (nonatomic, strong)SQLInsert *insertion;
@property (nonatomic, strong)SQLUpdate *updating;
@property (nonatomic, strong)SQLDelete *deleteC;

/**  */
@property (nonatomic, assign)eSQLOperation operation;

/** 最后一次指定的column */
@property (nonatomic, strong)SQLColumn *choosenColumn;

/**  */
//@property (nonatomic, strong)NSMutableArray *columnArray;

@end

@implementation SQLTable

+ (instancetype)table:(NSString *)table {
    SQLTable *t = [SQLTable new];
    
    t.tableName = table;
    
    return t;
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
- (SQLInsert *)insertion {
    if (!_insertion) {
        _insertion = [SQLInsert insert:_tableName];
    }
    return _insertion;
}
- (SQLUpdate *)updating {
    if (!_updating) {
        _updating = [SQLUpdate update:_tableName];
    }
    return _updating;
}
- (SQLDelete *)deleteC {
    if (!_deleteC) {
        _deleteC = [SQLDelete deleteFrom:_tableName];
    }
    return _deleteC;
}
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

@implementation SQLTable (Insert)

- (SQLInsert *)insert {
    return self.insertion;
}



@end

@implementation SQLTable (Update)
- (SQLUpdate *)update {
    return self.updating;
}
@end

@implementation SQLTable (Delete)

- (SQLDelete *)deleteColumn {
    return self.deleteC;
}

@end

