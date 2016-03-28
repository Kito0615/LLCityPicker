//
//  DistrictPickView.m
//  CityPicker
//
//  Created by AnarL on 16/3/28.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "DistrictPickView.h"

@interface DistrictPickView() <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIPickerView * _pickerView;
    
    NSArray * _provinceData;
    NSArray * _citiesData;
    NSArray * _districtData;
}

@end

@implementation DistrictPickView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _provinceData = [[NSMutableArray alloc] init];
        _citiesData = [[NSMutableArray alloc] init];
        _districtData = [[NSMutableArray alloc] init];
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        [self createUI];
        [self setupPickerData];
        
    }
    return self;
}

- (void)createUI
{
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.bounds.size.width, self.bounds.size.width, 250)];
    _pickerView.backgroundColor = [UIColor whiteColor];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [self addSubview:_pickerView];
    
    UIButton * doneBtn = [[UIButton alloc] init];
    doneBtn.frame = CGRectMake(self.bounds.size.width - 100, self.bounds.size.height - 280, 80, 25);
    [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    [doneBtn addTarget:self action:@selector(selectedDistrict:) forControlEvents:UIControlEventTouchUpInside];
    doneBtn.layer.cornerRadius = 5;
    doneBtn.layer.masksToBounds = YES;
    [doneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [doneBtn setBackgroundColor:[UIColor blueColor]];
    [self addSubview:doneBtn];
}
- (void)setupPickerData
{
    NSString * pickerDataPath = [[NSBundle mainBundle] pathForResource:@"DistrictList.plist" ofType:nil];
    
    _provinceData = [NSArray arrayWithContentsOfFile:pickerDataPath];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark -UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return _provinceData.count;
            break;
        case 1:
            _citiesData = [[_provinceData objectAtIndex:[pickerView selectedRowInComponent:0]] objectForKey:@"cities"];
            return _citiesData.count;
            break;
        case 2:
            _districtData = [[_citiesData objectAtIndex:[pickerView selectedRowInComponent:1]] objectForKey:@"areas"];
            return _districtData.count;
            break;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [[_provinceData objectAtIndex:row] objectForKey:@"state"];
    } else if (component == 1) {
        return [[_citiesData objectAtIndex:row] objectForKey:@"city"];
    } else {
        return [_districtData objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _citiesData = [[_provinceData objectAtIndex:row] objectForKey:@"cities"];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    if (component == 1) {
        _districtData = [[_citiesData objectAtIndex:row] objectForKey:@"areas"];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
}

#pragma mark -Button Action
- (void)selectedDistrict:(UIButton *)btn
{
    NSString * selectedString;
    if (_districtData.count == 0) {
        if (![[[_provinceData objectAtIndex:[_pickerView selectedRowInComponent:0]] objectForKey:@"state"] isEqualToString:@"海南"]) {
            selectedString = [NSString stringWithFormat:@"%@市%@区", [[_provinceData objectAtIndex:[_pickerView selectedRowInComponent:0]] objectForKey:@"state"], [[_citiesData objectAtIndex:[_pickerView selectedRowInComponent:1]] objectForKey:@"city"]];
        } else {
            selectedString = [NSString stringWithFormat:@"%@省%@市", [[_provinceData objectAtIndex:[_pickerView selectedRowInComponent:0]] objectForKey:@"state"], [[_citiesData objectAtIndex:[_pickerView selectedRowInComponent:1]] objectForKey:@"city"]];
        }
    } else {
        selectedString = [NSString stringWithFormat:@"%@省%@市%@", [[_provinceData objectAtIndex:[_pickerView selectedRowInComponent:0]] objectForKey:@"state"], [[_citiesData objectAtIndex:[_pickerView selectedRowInComponent:1]] objectForKey:@"city"], [_districtData objectAtIndex:[_pickerView selectedRowInComponent:2]]];
    }
    _selection(selectedString);
}

@end
