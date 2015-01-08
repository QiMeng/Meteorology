//
//  EarlyWarningModel.h
//  Meteorology
//
//  Created by QiMENG on 1/8/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//
//  预警模块
#import <Foundation/Foundation.h>

@interface EarlyWarningModel : NSObject

@property (nonatomic, copy) NSString * address; //"渤海北部沿岸",
@property (nonatomic, assign) CGFloat lat;      //纬度
@property (nonatomic, assign) CGFloat lon;      //经度
@property (nonatomic, copy) NSNumber * code;      //不知道干啥的
@property (nonatomic, copy) NSString * desc0;    //"晴"
@property (nonatomic, copy) NSString * desc1;    //"晴"


@end
