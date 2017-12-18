//
//  RBTestViewController.m
//  DBHelp_Example
//
//  Created by Ray Boring on 2017/12/18.
//  Copyright © 2017年 wzc5670594. All rights reserved.
//

#import "RBTestViewController.h"


#import <DBHelp/NSValueBinding.h>

#import <DBHelp/SQLTable.h>

#import <DBHelp/SQLSelection.h>

@interface RBTestViewController ()

@end

@implementation RBTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SQLTable *table = [SQLTable table:@"table"];
    
    ///创建表
    NSLog(@"%@", table.create.column(@"1", eSQLBindTypeInt).column(@"2", eSQLBindTypeBool).column(@"3", eSQLBindTypeText).column(@"1", eSQLBindTypeReal).sqlExpression());
    
    table.select.column(@"1").where(@"2").between(@1, @3);
    
    NSLog(@"%@", table.select.sqlExpression());
    
    table.select.column(@"1").where(@"2").between(@"1", @"3");
    
    NSLog(@"%@", table.select.sqlExpression());
    
    ///insert
    table.insert.columns(@"1", @"2", @"2", @"2", @"2", @3, nil).values(@"3", @5, @56.54566, nil);
    
    NSLog(@"%@", table.insert.sqlExpression());
    
}

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
