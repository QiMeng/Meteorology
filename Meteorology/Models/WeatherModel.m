//
//  WeatherModel.m
//  Meteorology
//
//  Created by QiMENG on 14-12-1.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

+ (id)itemFromDic:(NSDictionary *)dic {
    
    WeatherModel * model = [[WeatherModel alloc]init];

    return model;
}

+ (id)itemFromArray:(NSArray *)array {
    
    if ([array isKindOfClass:[NSArray class]] && array.count == 14) {
        
        WeatherModel * model = [[WeatherModel alloc]init];
        model.city = array[0];
        model.lat = [array[1] floatValue];
        model.lon = [array[2] floatValue];
        model.date0 = array[3];
        model.desc = array[4];
        model.temp0 = array[5];
        model.code0 = array[6];
        model.temp1 = array[7];
        model.code1 = array[8];
        model.imgStr0 = array[9];
        model.imgStr1 = array[10];
        model.htmlUrlStr = array[11];
        model.date1 = array[12];
        model.date2 = array[13];
        
        return model;
        
    }
    return nil;
}


@end
