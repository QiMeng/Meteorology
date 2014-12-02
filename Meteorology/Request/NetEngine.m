//
//  NetEngine.m
//  Meteorology
//
//  Created by QiMENG on 14-12-1.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "NetEngine.h"

#import "WeatherModel.h"

#import <JSONKit.h>

@implementation NetEngine

+ (NetEngine *)share {
    
    static NetEngine * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[NetEngine alloc]init];
        }
    });
    
    return instance;
}

#pragma mark - 天气预报
+ (NetEngine *)weatherEngine{
    
    if (![NetEngine share].weatherEngine) {
        [NetEngine share].weatherEngine = [[NetEngine alloc]initWithHostName:@"typhoon.weather.gov.cn"];
    }
    return [NetEngine share].weatherEngine;
    
}
-(MKNetworkOperation*)weatherUrlStr:(NSString*) urlstr
                      onWeatherData:(WeatherDataBlock) completion
                            onError:(MKNKErrorBlock) errorBlock {
    
    MKNetworkOperation *op = [self operationWithPath:urlstr
                                              params:nil
                                          httpMethod:@"GET"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSString *valueString = [completedOperation responseString] ;
        DLog(@"%@", valueString);
        
        if([completedOperation isCachedResponse]) {
            DLog(@"Data from cache %@", [completedOperation responseJSON]);
        }
        else {
            DLog(@"Data from server %@", [completedOperation responseString]);
        }
        
        NSArray * items = [valueString objectFromJSONString];
        
        if ([items isKindOfClass:[NSArray class]]) {
            
            @autoreleasepool {
                
                NSMutableArray * tempArray = [NSMutableArray array];
                
                for (NSArray * array in items) {
                    [tempArray addObject:[WeatherModel itemFromArray:array]];
                }
                
                completion(tempArray);
                
            }
            
        }else {
            
            completion(@"数据结构错误,稍后重试");
            
        }
        

    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {

        errorBlock(error);
        
    }];
    
    
    [self enqueueOperation:op];
    
    return op;
    
    
    
}




@end
