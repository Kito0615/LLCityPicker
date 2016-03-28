//
//  DistrictPickerViewController.h
//  CityPicker
//
//  Created by AnarL on 16/3/22.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DistrictPickerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *pickedDistrict;

- (IBAction)showPicker:(UIButton *)sender;
@end
