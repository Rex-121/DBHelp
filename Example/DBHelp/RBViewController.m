//
//  RBViewController.m
//  DBHelp
//
//  Created by wzc5670594 on 12/15/2017.
//  Copyright (c) 2017 wzc5670594. All rights reserved.
//

#import "RBViewController.h"

#import <DBHelp/NSValueBinding.h>

@interface RBViewController ()

@end

@implementation RBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    SQLExpression *x = [SQLExpression new];
//    x.safe = @"3";
//    
//    NSLog(@"%@", x.safe);
    NSString *z = @"3";

//    [(NSString *)z.declareSqlValue isEqualToString:@"3"];
    
    NSLog(@"%@,%@", z.sqlValue, z.sqlType);
    
    NSNumber *x = @3.9;
    NSLog(@"%@,%@", x.sqlValue, x.sqlValueType(eSQLBindTypeReal));

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
