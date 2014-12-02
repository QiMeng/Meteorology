//
//  FirstEngine.h
//  Meteorology
//
//  Created by QiMENG on 14-11-26.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface FirstEngine : MKNetworkEngine


typedef void (^CurrencyResponseBlock)(double rate);

-(MKNetworkOperation*) currencyRateFor:(NSString*) sourceCurrency
                            inCurrency:(NSString*) targetCurrency
                          onCompletion:(CurrencyResponseBlock) completion
                               onError:(MKNKErrorBlock) error;

@end
