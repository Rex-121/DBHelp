# DBHelp

[![Version](https://img.shields.io/cocoapods/v/DBHelp.svg?style=flat)](http://cocoapods.org/pods/DBHelp)
[![License](https://img.shields.io/cocoapods/l/DBHelp.svg?style=flat)](http://cocoapods.org/pods/DBHelp)
[![Platform](https://img.shields.io/cocoapods/p/DBHelp.svg?style=flat)](http://cocoapods.org/pods/DBHelp)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```ruby
SQLTable *table = [SQLTable table:@"table1"];

table.create.newColumn(@"id", eSQLBindTypeInteger).primaryKey();
table.create.newColumn(@"name", eSQLBindTypeText).unique().notNull();
table.create.column(@"age", eSQLBindTypeInteger);
table.create.newColumn(@"company", eSQLBindTypeText).defaultValue(@"home");
table.create.newColumn(@"createtime", eSQLBindTypeReal);

///创建表
///CREATE TABLE table1 ( id INTEGER PRIMARY KEY, name TEXT UNIQUE NOT NULL, age INTEGER, company TEXT DEFAULT 'home', createtime REAL );
NSLog(@"%@", table.create.sqlExpression());

```


```ruby
///select
table.select.where(@"age").equal(@28);
///SELECT * FROM table1 where age = 28;
NSLog(@"%@", table.select.sqlExpression());
```
```ruby
/// count
table.select.column(@"1").count.columnAsAlias(@"4", @"").columnAsAlias(@"3", @"3别名").where(@"2").between(@"1", @"3");
///DBHelp_Example[2198:168639] SELECT COUNT(1, 4, 3 AS 3别名) FROM table1 where 2 between '1' and '3';
NSLog(@"%@", table.select.sqlExpression());
```

```ruby
///insert
table.insert.columns(@"id", @"name", @"age", @"company", @"createtime", nil).values([NSNull null], @"Ray", @28, [NSNull null], @4145123.4, nil);
///INSERT INTO table1 ( id, name, age, company, createtime ) VALUES ( null, 'Ray', 28, null, 4145123.4 );
NSLog(@"%@", table.insert.sqlExpression());
```

```ruby
///update
table.update.set(@"4", @"update").set(@"56", @4);
///UPDATE table1 SET 4 = 'update', 56 = 4
NSLog(@"%@", table.update.sqlExpression());

table.update.set(@"4", @"update").set(@"56", @778).where(@"4").equal(@"f");
///UPDATE table1 SET 4 = 'update', 56 = 778 where 4 = 'f'
NSLog(@"%@", table.update.sqlExpression());
```

///delete
```ruby
///DELETE FROM table1
NSLog(@"%@", table.deleteColumn.sqlExpression());

table.deleteColumn.where(@"4").symbol(@">", @4);
///DELETE FROM table1 where 4 > 4
NSLog(@"%@", table.deleteColumn.sqlExpression());
```

```ruby
SQLTable *table2 = [SQLTable table:@"table2"];

table2.select.where(@"4").symbol(@">", @4).andCondition(@"k").equal(@"z").andCondition(@"4").symbol(@">", @5).andCondition(@"3").between(@5, @6);
///SELECT * FROM table2 where 4 > 4 AND k = 'z' AND 4 > 5 AND 3 between 5 and 6;
NSLog(@"%@", table2.select.sqlExpression());



[table2.select.where(@"4").symbol(@">", @4).andCondition(@"5") inRange:@3, @"4", @4555, @5, nil];
///SELECT * FROM table2 where 4 > 4 AND 5 IN (3, '4', 4555, 5) AND 4 > 5 AND 3 between 5 and 6;
NSLog(@"%@", table2.select.sqlExpression());

///SELECT * FROM k where list IN ('4', '5', 5);
NSLog(@"%@", [self testList:@"4", @"5", @5]);

```

## Requirements

## Installation

DBHelp is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DBHelp'
```

## Author

Ray, 18511234520@163.com

## License

DBHelp is available under the MIT license. See the LICENSE file for more info.
