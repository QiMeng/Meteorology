//
//  NetEngine.h
//  Meteorology
//
//  Created by QiMENG on 14-12-1.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import <MKNetworkEngine.h>

@interface NetEngine : MKNetworkEngine

@property (nonatomic, strong) NetEngine * weatherEngine;


//+ (NetEngine *)
+ (NetEngine *)weatherEngine;


typedef void (^WeatherDataBlock)(id weathers);
-(MKNetworkOperation*)weatherUrlStr:(NSString*) urlstr
                      onWeatherData:(WeatherDataBlock) completion
                            onError:(MKNKErrorBlock) errorBlock;


@end
