//
//  ViewController.h
//  Meteorology
//
//  Created by QiMENG on 14-11-26.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MKNetworkOperation.h>
#import <MapKit/MapKit.h>

#import "WeatherView.h"

@interface ViewController : UIViewController {
    
    __weak IBOutlet UIView *mapSuperView;
    
    __weak IBOutlet WeatherView *bottomView;
    
    __weak IBOutlet MKMapView *myMapView;

    __weak IBOutlet UIView *haiquView;  
    
    __weak IBOutlet UIView *zaihaiView;
    
    
    
    
}





//@property (strong, nonatomic) MKNetworkOperation *currencyOperation;
@end
