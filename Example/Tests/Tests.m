//
//  DBHelpTests.m
//  DBHelpTests
//
//  Created by wzc5670594 on 12/15/2017.
//  Copyright (c) 2017 wzc5670594. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import <DBHelp/SQLExpression.h>
#import <DBHelp/SQLTable.h>
SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{

  context(@"will fail", ^{
      
      

      it(@"can do maths", ^{

          SQLTable *table = [SQLTable table:@"table"];
          
          ///创建表
          NSLog(@"%@", table.create.column(@"1", eSQLBindTypeInt).column(@"2", eSQLBindTypeBool).column(@"3", eSQLBindTypeText).sqlExpression());
          
          table.select.column(@"1").where(@"2").between(@1, @3);
          
          NSLog(@"%@", table.select.sqlExpression());
          
      });

//      it(@"can read", ^{
//          [[@"number" should] equal:@"string"];
//      });
//
//      it(@"will wait and fail", ^{
//          NSObject *object = [[NSObject alloc] init];
//          [[expectFutureValue(object) shouldEventually] receive:@selector(autoContentAccessingProxy)];
//      });
  });

  context(@"will pass", ^{
    
      it(@"can do maths", ^{
        [[@1 should] beLessThan:@23];
      });
    
      it(@"can read", ^{
          [[@"team" shouldNot] containString:@"I"];
      });  
  });
  
});

SPEC_END

