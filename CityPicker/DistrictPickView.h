//
//  DistrictPickView.h
//  CityPicker
//
//  Created by AnarL on 16/3/28.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectedDistrictItem)(NSString * district);
@interface DistrictPickView : UIView
@property (nonatomic, copy) selectedDistrictItem selection;

- (instancetype)initWithFrame:(CGRect)frame;
@end
