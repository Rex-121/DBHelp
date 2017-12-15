//
//  RBViewController.m
//  DBHelp
//
//  Created by wzc5670594 on 12/15/2017.
//  Copyright (c) 2017 wzc5670594. All rights reserved.
//

#import "RBViewController.h"

#import <DBHelp/NSValueBinding.h>

#import <DBHelp/SQLCreation.h>

#import <DBHelp/SQLSelection.h>

@interface RBViewController ()

@end

@implementation RBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *z = @"3";
    
    NSLog(@"%@,%@", z.sqlValue, z.sqlType);
    
    NSNumber *x = @3.9;
    NSLog(@"%@,%@", x.sqlValue, x.sqlValueType(eSQLBindTypeReal));

	
    SQLCreation *sql = [SQLCreation new];
    
    sql.column(@"f", eSQLBindTypeReal).column(@"real", eSQLBindTypeReal).column(@"text", eSQLBindTypeText).column(@"int", eSQLBindTypeInt).table(@"test").column(@"real", eSQLBindTypeReal);

    NSLog(@"%@", sql.sqlExpression());
    
    NSLog(@"%@", [self dd:sql]);
    
    SQLSelection *select = [SQLSelection new];
    select.table(@"te");
    
    NSLog(@"%@", [self dd:select]);
//    select.column
    
    
}

- (NSString *)dd:(id<SQLPreparation>)sql {
    sql.table(@"5555");
    return sql.sqlExpression();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
