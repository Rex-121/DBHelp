//
//  DBHelpTests.m
//  DBHelpTests
//
//  Created by wzc5670594 on 12/15/2017.
//  Copyright (c) 2017 wzc5670594. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import <DBHelp/SQLExpression.h>

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{

  context(@"will fail", ^{
      
      

      it(@"can do maths", ^{
//          SQLExpression *x = [SQLExpression new];
//          x.safe = @"3";
          
          NSString *z = @"3";
          
          [(NSString *)z.declareSqlValue() isEqualToString:@"3"];
          
          NSLog(@"%@,%@", z.declareSqlValue, z.declareSqlType);
//          [x.safe isEqualToString:@"3"];
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

