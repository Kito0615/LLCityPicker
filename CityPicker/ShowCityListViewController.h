//
//  ShowCityListViewController.h
//  CityPicker
//
//  Created by AnarL on 16/3/22.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ShowCityListViewController : UIViewController

- (IBAction)showSelection:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *selectedCity;
@end
