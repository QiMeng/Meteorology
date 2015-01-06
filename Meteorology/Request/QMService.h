//
//  QMService.h
//  MengYue
//
//  Created by QiMENG on 14-12-18.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "WeatherModel.h"
//#import <SVProgressHUD.h>

#define QMServiceShare [QMService sharedManager]

typedef void (^CompletionBlock)(id sender);
typedef void (^FailBlock)(id error);

@interface QMService : MKNetworkEngine

+ (MKNetworkEngine *)sharedManager;

/**
 *  获取天气预报列表
 *
 *  @param aPathStr        接口参数
 *  @param completionBlock 完成 < NSArray : WeatherModel >
 *  @param failBlock       失败 < NSString: 错误信息 >
 */
+ (void)QM_MK_WeatherUrlPath:(NSString *)aPathStr
           completionHandler:(CompletionBlock)completionBlock
                 failHandler:(FailBlock)failBlock ;


#pragma mark - 错误编码
/**
 *  根据错误编码,返回错误信息
 *
 *  @param indeger 错误编码
 *
 *  @return 错误信息
 */
+ (NSString *)errorMessageFromCode:(NSInteger)indeger;

@end
