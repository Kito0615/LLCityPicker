//
//  AppDelegate.m
//  CityPicker
//
//  Created by AnarL on 16/3/22.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "AppDelegate.h"
#import "ShowCityListViewController.h"
#import "DistrictPickerViewController.h"

@interface AppDelegate ()
{
    ShowCityListViewController * _showListVC;
    DistrictPickerViewController * _districtPickerVC;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    _showListVC = [[ShowCityListViewController alloc] initWithNibName:@"ShowCityListViewController" bundle:nil];
    _showListVC.tabBarItem.image = [UIImage imageNamed:@"City"];
    _showListVC.title = @"城市选择";
    _districtPickerVC = [[DistrictPickerViewController alloc] init];
    _districtPickerVC.tabBarItem.image = [UIImage imageNamed:@"District"];
    _districtPickerVC.title = @"区县选择";
    
    NSArray * array = @[_districtPickerVC, _showListVC];
    
    
    UITabBarController * tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = array;
    _window.rootViewController = tabbar;
    
    
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
