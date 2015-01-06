//
//  WeatherViewController.h
//  Meteorology
//
//  Created by QiMENG on 15/1/7.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherViewController : UIViewController {
    
    
    __weak IBOutlet UITableView *myTableView;
    
    
}

@property (nonatomic, strong) NSArray * weatherArray;

@end
