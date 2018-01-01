//
//  RBTestViewController.m
//  DBHelp_Example
//
//  Created by Ray Boring on 2017/12/18.
//  Copyright © 2017年 wzc5670594. All rights reserved.
//

#import "RBTestViewController.h"


//#import <DBHelp/NSValueBinding.h>

#import <DBHelp/SQLTable.h>

#import <FMDB/FMDB.h>

@interface RBTestViewController ()

@end

@implementation RBTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CFAbsoluteTime t = CFAbsoluteTimeGetCurrent();
    
    SQLTable *table = [SQLTable table:@"table1"];
    
    table.create.newColumn(@"id", eSQLBindTypeInteger).primaryKey();
    table.create.newColumn(@"name", eSQLBindTypeText).unique().notNull();
    table.create.column(@"age", eSQLBindTypeInteger);
    table.create.newColumn(@"company", eSQLBindTypeText).defaultValue(@"home");
    table.create.newColumn(@"createtime", eSQLBindTypeReal);
    
    ///创建表
    ///CREATE TABLE table1 ( id INTEGER PRIMARY KEY, name TEXT UNIQUE NOT NULL, age INTEGER, company TEXT DEFAULT 'home', createtime REAL );
    NSLog(@"%@", table.create.sqlExpression());
    
    ///select
    table.select.where(@"age").equal(@28);
    ///SELECT * FROM table1 where age = 28;
    NSLog(@"%@", table.select.sqlExpression());
    
    
    /// count
    table.select.column(@"1").count.columnAsAlias(@"4", @"").columnAsAlias(@"3", @"3别名").where(@"2").between(@"1", @"3");
    ///DBHelp_Example[2198:168639] SELECT COUNT(1, 4, 3 AS 3别名) FROM table1 where 2 between '1' and '3';
    NSLog(@"%@", table.select.sqlExpression());
    
    
    ///insert
    table.insert.columns(@"id", @"name", @"age", @"company", @"createtime", nil).values([NSNull null], @"Ray", @28, [NSNull null], @4145123.4, nil);
    ///INSERT INTO table1 ( id, name, age, company, createtime ) VALUES ( null, 'Ray', 28, null, 4145123.4 );
    NSLog(@"%@", table.insert.sqlExpression());
    
    
    ///update
    table.update.set(@"4", @"update").set(@"56", @4);
    ///UPDATE table1 SET 4 = 'update', 56 = 4
    NSLog(@"%@", table.update.sqlExpression());
    
    table.update.set(@"4", @"update").set(@"56", @778).where(@"4").equal(@"f");
    ///UPDATE table1 SET 4 = 'update', 56 = 778 where 4 = 'f'
    NSLog(@"%@", table.update.sqlExpression());
    
    
    ///delete
    ///DELETE FROM table1
    NSLog(@"%@", table.deleteColumn.sqlExpression());
    
    table.deleteColumn.where(@"4").symbol(@">", @4);
    ///DELETE FROM table1 where 4 > 4
    NSLog(@"%@", table.deleteColumn.sqlExpression());
    
    
    
    SQLTable *table2 = [SQLTable table:@"table2"];
    
    table2.select.where(@"4").symbol(@">", @4).andCondition(@"k").equal(@"z").andCondition(@"4").symbol(@">", @5).andCondition(@"3").between(@5, @6);
    ///SELECT * FROM table2 where 4 > 4 AND k = 'z' AND 4 > 5 AND 3 between 5 and 6;
    NSLog(@"%@", table2.select.sqlExpression());
    
    
    
    [table2.select.where(@"4").symbol(@">", @4).andCondition(@"5") inRange:@3, @"4", @4555, @5, nil];
    ///SELECT * FROM table2 where 4 > 4 AND 5 IN (3, '4', 4555, 5) AND 4 > 5 AND 3 between 5 and 6;
    NSLog(@"%@", table2.select.sqlExpression());
    
    [table2.select.where(@"55") inRangeWithArray:@[@"fggg", @44]];
    
    NSLog(@"%@", table2.select.sqlExpression());
    ///SELECT * FROM k where list IN ('4', '5', 5);
    NSLog(@"%@", [self testList:@"4", @"5", @5]);
    
    
//    table2.alter.renameTo(@"table3");
    
//    NSLog(@"%@", table2.alter.sqlExpression());
    
    table2.alter.addColumn(@"45", eSQLBindTypeInteger).unique().notNull();
    NSLog(@"%@", table2.alter.sqlExpression());
    
    
    table2.select.orderBy(@"5").limit(3).offset(5).sequence(eSequenceDescend);
    NSLog(@"%@", table2.select.sqlExpression());
    
    CFAbsoluteTime tz = CFAbsoluteTimeGetCurrent();
    NSLog(@"%f", tz - t);
}


- (NSString *)testList:(NSString *)x, ... {
    
    va_list list;
    
    va_start(list, x);
    
    SQLTable *k = [SQLTable table:@"k"];
    
    [k.select.where(@"list") inRangeWithList:list value:x];
    
    va_end(list);
    
    return k.select.sqlExpression();
}

//- (void)createDataBase {
//    
////    /Users/ray/Desktop
//    
//    FMDatabase *db = [FMDatabase databaseWithPath:@"/Users/ray/Desktop/test.db"];
//    
//    SQLTable *table = [SQLTable table:@"talbe1"];
//    
//    table.create.newColumn(@"id", eSQLBindTypeInteger).primaryKey();
//    table.create.newColumn(@"name", eSQLBindTypeText).unique().notNull();
//    table.create.column(@"age", eSQLBindTypeInteger);
//    table.create.newColumn(@"company", eSQLBindTypeText).defaultValue(@"home");
//    table.create.newColumn(@"createtime", eSQLBindTypeReal);
//    
//    [db open];
//    [db executeStatements:table.create.sqlExpression()];
//    [db close];
//    
//    
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    NSLog(@"%@", self);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
