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
    
    [[NetEngine weatherEngine] weatherUrlStr:@"Typhoon/proxy2.jsp?u=weather_level&p=1"
                               onWeatherData:^(NSArray * weathers) {
                                   NSLog(@"%@",weathers);
                                   
                                   if ([weathers isKindOfClass:[NSString class]]) {
                                       //to do ... 数据错误
                                   }
                                   else if ([weathers isKindOfClass:[NSArray class]]) {
                                       
                                       [_showWeathers removeAllObjects];

                                       [_showWeathers addObjectsFromArray:weathers];
//                                       for (int i = 0;i< weathers.count;i++) {
//                                           WeatherModel * model = weathers[i];
//                                           if (i%3 == 0) {
//                                               [_showWeathers addObject:model];
//                                           }
//                                       }
                                   }
                                   
                                   [MBProgressHUD hideHUDForView:bottomView animated:YES];
                                   
                               } onError:^(NSError *error) {
                                   [MBProgressHUD hideHUDForView:bottomView animated:YES];
                               }];
    
    
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
