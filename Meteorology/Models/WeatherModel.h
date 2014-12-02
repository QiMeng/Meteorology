//
//  WeatherModel.h
//  Meteorology
//
//  Created by QiMENG on 14-12-1.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property (nonatomic, copy) NSString * city;    //城市名称
@property (nonatomic, assign) CGFloat lat;      //纬度
@property (nonatomic, assign) CGFloat lon;      //经度
@property (nonatomic, copy) NSString * date0;   //日期:12月02日
@property (nonatomic, copy) NSString * desc;    //描述:阵雪-阵雪
@property (nonatomic, copy) NSString * temp0;   //气温:-13.0
@property (nonatomic, copy) NSString * code0;   //预留字段
@property (nonatomic, copy) NSString * temp1;   //气温:-17.0
@property (nonatomic, copy) NSString * code1;   //预留字段
@property (nonatomic, copy) NSString * imgStr0; //图片:d13.gif
@property (nonatomic, copy) NSString * imgStr1; //图片:n13.gif
@property (nonatomic, copy) NSString * htmlUrlStr;//详细信息html页面
@property (nonatomic, copy) NSString * date1;   //日期:20141202
@property (nonatomic, copy) NSString * date2;   //日期:2014-12-02 18:00

+ (id)itemFromDic:(NSDictionary *)dic;

+ (id)itemFromArray:(NSArray *)array;

@end
