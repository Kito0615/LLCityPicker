//
//  CityListViewController.h
//  CityPicker
//
//  Created by AnarL on 16/3/22.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectedCityBlock)(NSString *);
@interface CityListViewController : UIViewController

@property (nonatomic, copy) selectedCityBlock block;

@end
