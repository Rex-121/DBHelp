# DBHelp

[![Version](https://img.shields.io/cocoapods/v/DBHelp.svg?style=flat)](http://cocoapods.org/pods/DBHelp)
[![License](https://img.shields.io/cocoapods/l/DBHelp.svg?style=flat)](http://cocoapods.org/pods/DBHelp)
[![Platform](https://img.shields.io/cocoapods/p/DBHelp.svg?style=flat)](http://cocoapods.org/pods/DBHelp)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

DBHelp is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DBHelp'
```

## support
```ruby

支持 create, count, select, insert, update, delete, between ... and ... 等语句

```

### Create
```ruby
创建表
SQLTable *table = [SQLTable table:@"table1"];

table.create.column(@"age", eSQLBindTypeInteger);

table.create.newColumn(@"id", eSQLBindTypeInteger).primaryKey();
table.create.newColumn(@"name", eSQLBindTypeText).unique().notNull();
table.create.newColumn(@"company", eSQLBindTypeText).defaultValue(@"home");
table.create.newColumn(@"createtime", eSQLBindTypeReal);

table.create.sqlExpression();
--> CREATE TABLE table1 ( id INTEGER PRIMARY KEY, name TEXT UNIQUE NOT NULL, age INTEGER, company TEXT DEFAULT 'home', createtime REAL );
```

### Select
```ruby
table.select.where(@"age").equal(@28);

table.select.sqlExpression();
--> SELECT * FROM table1 where age = 28;
```

### Count
```ruby
table.select.column(@"name").count.columnAsAlias(@"height", @"").columnAsAlias(@"company", @"company别名").where(@"age").between(20, 27);

table.select.sqlExpression();
--> SELECT COUNT(name, height, company AS company别名) FROM table1 where age between 20 and 27;
```

### Insert
```ruby
table.insert.columns(@"id", @"name", @"age", @"company", @"createtime", nil).values([NSNull null], @"Ray", @28, [NSNull null], @4145123.4, nil);

table.insert.sqlExpression();
--> INSERT INTO table1 ( id, name, age, company, createtime ) VALUES ( null, 'Ray', 28, null, 4145123.4 );
```

### Update
```ruby
table.update.set(@"company", @"update").set(@"age", @24);
table.update.sqlExpression();
--> UPDATE table1 SET company = 'update', age = 24;
```

```ruby
table.update.set(@"company", @"update").set(@"age", @5).where(@"name").equal(@"Ray");
table.update.sqlExpression();
--> UPDATE table1 SET company = 'update', age = 25 where name = 'Ray';
```

### Delete && Symbol
```ruby
table.deleteColumn.where(@"age").symbol(@">", @4);
table.deleteColumn.sqlExpression();
--> DELETE FROM table1 where age > 4;
```

### Conditions
```ruby
table.select.where(@"age").symbol(@">", @4).andCondition(@"name").equal(@"Ray").andCondition(@"salary").symbol(@">", @25000).andCondition(@"height").between(@150, @160);

table.select.sqlExpression();
--> SELECT * FROM table1 where age > 4 AND name = 'Ray' AND salary > 25000 AND 3 between 150 and 160;
```

```ruby
[table.select.where(@"age").symbol(@">", @4).andCondition(@"height") inRange:@133, @144, @155, @166, nil];
table.select.sqlExpression();
--> SELECT * FROM table1 where age > 4 AND height IN (133, 144, 155, 166);
```

### Alter
```ruby
table.alter.addColumn(@"age", eSQLBindTypeInteger).unique().notNull();
```



## Author

Ray, 18511234520@163.com

## License

DBHelp is available under the MIT license. See the LICENSE file for more info.
