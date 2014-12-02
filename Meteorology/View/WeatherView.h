//
//  WeatherView.h
//  Meteorology
//
//  Created by QiMENG on 14-12-3.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherView : UIView {
    
    UIImageView * weatherImageView; //天气信息背景图片
    
    UILabel * weatherTempLabel;     //天气温度信息
    
    UILabel * cityLabel;            //地区
    
    UIImageView * iconBackgroundImageView;   //天气状况背景图片
    
    UIImageView * iconImageView;            //天气状况图片
    
    
    
    
}

@end
