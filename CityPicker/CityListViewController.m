//
//  CityListViewController.m
//  CityPicker
//
//  Created by AnarL on 16/3/22.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "CityListViewController.h"

@interface CityListViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary * _dataSource;
    NSArray * _keysArray;
    
    UITableView * _tableview;
}

@end

@implementation CityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    UIBarButtonItem * barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissPage)];
    self.navigationItem.leftBarButtonItem = barItem;
    [self setupTableView];
    [self setupDataSource];
}

- (void)setupTableView
{
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    _tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableview.sectionIndexBackgroundColor = [UIColor clearColor];
}

- (void)setupDataSource
{
    NSString * dataPath = [[NSBundle mainBundle] pathForResource:@"CityList.plist" ofType:nil];
    
    _dataSource = [NSDictionary dictionaryWithContentsOfFile:dataPath];
    
    _keysArray = [[_dataSource allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)dismissPage
{
    [self dismissViewControllerAnimated:YES completion:^{
        self.block([_tableview cellForRowAtIndexPath:_tableview.indexPathForSelectedRow].textLabel.text);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keysArray.count > 0 ? _keysArray.count : 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = [UIColor blueColor];
    titleLabel.text = [NSString stringWithFormat:@"    %@", _keysArray[section]];
    return titleLabel;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * cityArray = [_dataSource objectForKey:[_keysArray objectAtIndex:section]];
    return cityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellname = @"city";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
    }
    
    cell.textLabel.text = [[_dataSource objectForKey:[_keysArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keysArray;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    
    _block(str);
    [self dismissPage];
}

@end
