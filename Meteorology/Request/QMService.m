//
//  QMService.m
//  MengYue
//
//  Created by QiMENG on 14-12-18.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "QMService.h"
#import "WeatherModel.h"
//#import "QMUserModel.h"
//#import "QMPersonModel.h"
//#import <JSONKit.h>

@implementation QMService

+ (QMService *)sharedManager
{
    static QMService *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        if (!sharedInstance) {
            sharedInstance = [[QMService alloc] initWithDefaultSettings];
        }
    });
    return sharedInstance;
}

- (id)initWithDefaultSettings {
    
    if(self = [super initWithHostName:@"typhoon.weather.gov.cn"]) {
        
    }
    
    return self;
}

#pragma mark - 获取天气预报列表
+ (void)QM_MK_WeatherUrlPath:(NSString *)aPathStr
                       completionHandler:(CompletionBlock)completionBlock
                             failHandler:(FailBlock)failBlock {
    
//    MKNetworkOperation *op = [QMServiceShare operationWithPath:@"user/getverificationcode"
//                                                        params:dic
//                                                    httpMethod:@"POST"];
//    [op setPostDataEncoding:MKNKPostDataEncodingTypeJSON];
    
    MKNetworkOperation *op = [QMServiceShare operationWithPath:aPathStr
                                              params:nil
                                          httpMethod:@"GET"];
    
    
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSArray * items = [completedOperation responseJSON];
        
        if ([items isKindOfClass:[NSArray class]]) {
            
            @autoreleasepool {
                
                NSMutableArray * tempArray = [NSMutableArray array];
                
                for (NSArray * array in items) {
                    [tempArray addObject:[WeatherModel itemFromArray:array]];
                }
                
                completionBlock(tempArray);
                
            }
            
        }else {
            
            failBlock(@"数据结构错误,稍后重试");
            
        }
        
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        failBlock(error.description);
        
    }];
    
    [QMServiceShare enqueueOperation:op];
    
}

 


#pragma mark - 根据错误编码,返回错误信息
+ (NSString *)errorMessageFromCode:(NSInteger)indeger{
    
    NSString * error = @"";
    
    switch (indeger) {
        case -1:
            error = @"通用系统错误";
            break;
        case -1000:
            error = @"请求不存在";
            break;
        case 1000:
            error = @"用户登录失败";
            break;
        case 1001:
            error = @"非法令牌";
            break;
        case 1002:
            error = @"用户不存在";
            break;
        case 1003:
            error = @"用户第一印象已经评价过";
            break;
        case 1004:
            error = @"昵称已存在";
            break;
        case 1005:
            error = @"用户已存在";
            break;
        case 1006:
            error = @"验证码非法";
            break;
        case 1007:
            error = @"IM帐号注册失败";
            break;
        case 1008:
            error = @"好友已关注";
            break;
        case 2000:
            error = @"业务不存在";
            break;
        case 2001:
            error = @"同时发拜托数量受限";
            break;
        case 2002:
            error = @"拜托已关闭";
            break;
        case 2003:
            error = @"已报名";
            break;
        case 2004:
            error = @"已评价";
            break;
        case 2005:
            error = @"拜托状态不正确";
            break;
        case 3000:
            error = @"已点赞";
            break;
            
        default:
            error = @"未知错误";
            break;
    }
    
    return error;
}

@end
