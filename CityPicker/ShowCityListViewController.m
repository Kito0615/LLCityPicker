//
//  ShowCityListViewController.m
//  CityPicker
//
//  Created by AnarL on 16/3/22.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "ShowCityListViewController.h"
#import "CityListViewController.h"
@interface ShowCityListViewController ()
{
    CityListViewController * _cityListVC;
}

@end

@implementation ShowCityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor yellowColor];
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

- (IBAction)showSelection:(UIButton *)sender {
    
    _cityListVC = [[CityListViewController alloc] init];
    
    _cityListVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    _cityListVC.modalPresentationStyle = UIModalPresentationFormSheet;
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:_cityListVC];
    _cityListVC.title = @"城市列表";
    _cityListVC.block = ^(NSString * str){
        self.selectedCity.text = str;
    };
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}

@end
