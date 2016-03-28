//
//  DistrictPickerViewController.m
//  CityPicker
//
//  Created by AnarL on 16/3/22.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "DistrictPickerViewController.h"
#import "DistrictPickView.h"

@interface DistrictPickerViewController ()
{
    DistrictPickView * _pickerView;
}


@end

@implementation DistrictPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPicker:(UIButton *)sender
{
    _pickerView = [[DistrictPickView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:_pickerView];
    
    [UIView animateWithDuration:0.5 animations:^{
        _pickerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 49);
    }];
    
    _pickerView.selection = ^(NSString * selectedDistrict){
        self.pickedDistrict.text = selectedDistrict;
        
        [UIView animateWithDuration:0.5 animations:^{
            _pickerView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
            _pickerView = nil;
        }];
    };
    
}

@end
