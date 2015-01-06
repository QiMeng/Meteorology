//
//  ViewController.m
//  Meteorology
//
//  Created by QiMENG on 14-11-26.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "UIView+Layer.h"

#import "NetEngine.h"
#import <MBProgressHUD.h>
#import "WeatherModel.h"


#import "QMService.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray * showWeathers;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [mapSuperView setRadius:10 BorderWidth:0 BorderColor:nil];
    
    [bottomView setRadius:10 BorderWidth:0 BorderColor:nil];
    
    [haiquView setRadius:10 BorderWidth:0 BorderColor:nil];
    
    [zaihaiView setRadius:10 BorderWidth:0 BorderColor:nil];
    
    _showWeathers = [NSMutableArray array];
    
    showWeatherInt = 0;
    
    [self touchRefresh:nil];
    
    
    
}

#pragma mark - 点击工具
- (IBAction)touchLocation:(id)sender {
}

- (IBAction)touchReduction:(id)sender {
 
}
- (IBAction)touchRefresh:(id)sender {
    
    [self refreshNoLocationWeatherData];

}
- (IBAction)touchRanging:(id)sender {
    
}
- (IBAction)touchSetting:(id)sender {
    
}

#pragma mark 数据获取
/**
 *  刷新没有定位时的天气预报数据
 */
- (void)refreshNoLocationWeatherData {
    
    [MBProgressHUD showHUDAddedTo:bottomView animated:YES];
    
//    [QMService networkLoginDic:@{@"body": @{@"phone": @"15259131237",@"passwd":@"123456"}}
//             completionHandler:^(id sender) {
//                 
//                 
//                 NSLog(@"账号:%@ 密码:%@",QMUserModelShare.user_im_account,@"123456");
//                 
//                 
//             } failHandler:^(id error) {
//                 
//                 [SVProgressHUD showErrorWithStatus:error];
//                 
//             }];

    [QMService QM_MK_WeatherUrlPath:@"Typhoon/proxy2.jsp?u=weather_level&p=1"
                  completionHandler:^(NSArray * weathers) {
                      
                      [_showWeathers removeAllObjects];
                      
                      [_showWeathers addObjectsFromArray:weathers];
                      
                      [self reloadWeather];
                      
                       [MBProgressHUD hideHUDForView:bottomView animated:YES];
                  } failHandler:^(NSString * errorStr) {
                      
                      NSLog(@"%@",errorStr);
                      [MBProgressHUD hideHUDForView:bottomView animated:YES];
                  }];
    
    
}

#pragma mark - 更新天气预报板块
- (void)reloadWeather {
    
    showWeatherInt++;
    if (showWeatherInt == _showWeathers.count-1) {
        showWeatherInt = 0;
    }
    
    bottomView.model = _showWeathers[showWeatherInt];
    
    [self performSelector:@selector(reloadWeather) withObject:nil afterDelay:5];
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
