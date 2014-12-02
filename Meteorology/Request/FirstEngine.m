//
//  FirstEngine.m
//  Meteorology
//
//  Created by QiMENG on 14-11-26.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "FirstEngine.h"

#define YAHOO_URL(__C1__, __C2__) [NSString stringWithFormat:@"d/quotes.csv?e=.csv&f=sl1d1t1&s=%@%@=X", __C1__, __C2__]


@implementation FirstEngine

-(MKNetworkOperation*) currencyRateFor:(NSString*) sourceCurrency
                            inCurrency:(NSString*) targetCurrency
                          onCompletion:(CurrencyResponseBlock) completionBlock
                               onError:(MKNKErrorBlock) errorBlock {
    
//    http://qimeng.github.io/phone/data.json
    
    
    
    
    MKNetworkOperation *op = [self operationWithPath:@"phone/data.json"//YAHOO_URL(sourceCurrency, targetCurrency)
                                              params:nil
                                          httpMethod:@"GET"];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         // the completionBlock will be called twice.
         // if you are interested only in new values, move that code within the else block
         
         NSString *valueString = [completedOperation responseString] ;
         DLog(@"%@", valueString);
         
         if([completedOperation isCachedResponse]) {
             DLog(@"Data from cache %@", [completedOperation responseJSON]);
         }
         else {
             DLog(@"Data from server %@", [completedOperation responseString]);
         }
         
         completionBlock([valueString doubleValue]);
         
     }onError:^(NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}


@end
