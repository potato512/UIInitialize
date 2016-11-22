//
//  ViewController.m
//  DemoUICreate
//
//  Created by zhangshaoyu on 16/11/15.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"视图";

    self.navigationItem.rightBarButtonItem = InsertBarButtonItemWithButton(CGRectMake(0.0, 0.0, 60.0, 44.0), 0, @"edit", @"done", [UIFont systemFontOfSize:15.0], [UIColor blackColor], [UIColor redColor], [UIColor orangeColor], UIEdgeInsetsZero, nil, nil, UIEdgeInsetsZero, nil, nil, nil, NO, self, @selector(buttonClick:));
    
    // 创建view
    UIView *view = InsertView(nil, CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 250.0), [UIColor greenColor], 5.0, [UIColor orangeColor], 5.0);

    // 创建tableview
    UITableView *tableview = InsertTableView(self.view, self.view.bounds, self, self, UITableViewStylePlain, UITableViewCellSeparatorStyleSingleLine);
    tableview.tableHeaderView = view;
    
    
    InsertProgressView(view, CGRectMake(100.0, 10.0, 100.0, 5.0), UIProgressViewStyleDefault, 0.5, [UIColor yellowColor], [UIColor redColor]);
    UILabel *label = InsertLabel(view, CGRectMake(10.0, 20.0, (self.view.bounds.size.width - 10.0 * 2), 20.0), NSTextAlignmentLeft, @"使用自定义方法创建label", [UIFont systemFontOfSize:10.0], [UIColor blackColor], NO);
    label.backgroundColor = [UIColor orangeColor];
    UIActivityIndicatorView *activityView = InsertActivityIndicatorView(view, CGRectMake(10.0, 50.0, 20.0, 20.0), [UIColor whiteColor], [UIColor brownColor], UIActivityIndicatorViewStyleGray);
    [activityView startAnimating];
    InsertPageControl(view, CGRectMake(40.0, 50.0, 60.0, 10.0), 5, 2, [UIColor blackColor], [UIColor redColor]);
    InsertSlider(view, CGRectMake(110.0, 50.0, 100.0, 30.0), nil, nil);
    InsertSwitch(view, CGRectMake(220.0, 50.0, 60.0, 30.0));
    InsertTextField(view, self, CGRectMake(10.0, 90.0, 120.0, 30.0), @"input your name", [UIFont systemFontOfSize:13.0], NSTextAlignmentLeft, UIControlContentVerticalAlignmentCenter, 1.0, [UIColor purpleColor], nil, 3.0, NO, UIKeyboardTypeDefault, UIReturnKeyDone);
    InsertSearchBar(view, CGRectMake(140.0, 90.0, 120.0, 30.0), self, @"search", UISearchBarStyleDefault, [UIColor redColor], [UIColor brownColor], nil);
    InsertSegment(view, @[@"red", @"green", @"brown", @"blue", @"black", @"white"], CGRectMake(10.0, 130.0, 300.0, 40.0), self, @selector(segmentClick:));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}


- (void)buttonClick:(UIButton *)button
{
    button.selected = !button.selected;
}

- (void)segmentClick:(UISegmentedControl *)segment
{
    NSArray *array = @[@"red", @"green", @"brown", @"blue", @"black", @"white"];
    NSInteger index = segment.selectedSegmentIndex;
    NSLog(@"点击了 %@", array[index]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    if (0 == indexPath.row)
    {
        cell.textLabel.text = @"alert view";
    }
    else if (1 == indexPath.row)
    {
        cell.textLabel.text = @"action sheet";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.row)
    {
        InsertAlert(UIAlertViewStyleDefault, @"温馨提示", @"你点击了", 0, nil, @"取消", @"确认");
    }
    else if (1 == indexPath.row)
    {
        InsertActionSheetWithMoreButton(self.view, nil, UIActionSheetStyleDefault, @"提示", @"cancel", @"警告", @"001", @"002");
    }
}

@end