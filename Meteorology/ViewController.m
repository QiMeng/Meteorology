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


@interface ViewController ()

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
    
    
    
    [self refreshWeatherData];
    
    
    
}

/**
 *  刷新天气预报数据
 */
- (void)refreshWeatherData {
    
    
    [[NetEngine weatherEngine] weatherUrlStr:@"Typhoon/proxy2.jsp?u=weather_level&p=1"
                               onWeatherData:^(id weathers) {
                                   NSLog(@"%@",weathers);
                                   
                                   if ([weathers isKindOfClass:[NSString class]]) {
                                       //to do ... 数据错误
                                   }
                                   else if ([weathers isKindOfClass:[NSArray class]]) {
                                       
                                       
                                       
                                   }
                                   
                                   
                                   
                               } onError:^(NSError *error) {
                                   
                               }];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
