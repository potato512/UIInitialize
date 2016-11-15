# SYUIInitMethod
##UI控件初始化方法集成封装类

##使用方法
```javascript
// 1 导入头文件 
#import "SYUIInitMethod.h"
```
```javascript
// 初始化使用UI控件 
// 创建view
UIView *view = InsertView(nil, CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 250.0), [UIColor greenColor], 5.0, [UIColor orangeColor], 5.0);

// 创建tableview
UITableView *tableview = InsertTableView(self.view, self.view.bounds, self, self, UITableViewStylePlain, UITableViewCellSeparatorStyleSingleLine);

// 创建label
InsertLabel(view, CGRectMake(10.0, 20.0, (self.view.bounds.size.width - 10.0 * 2), 20.0), NSTextAlignmentLeft, @"使用自定义方法创建label", [UIFont systemFontOfSize:10.0], [UIColor blackColor], NO);
```

##注意事项：
SYUIInitMethod类是MRC内存管理模式，如果项目是ARC内存管理模式，记得设置支持ARC模式。
![支持ARC](./DemoUICreate/supportARC.png)

##效果图
![效果图](./DemoUICreate/UIImage.gif)

