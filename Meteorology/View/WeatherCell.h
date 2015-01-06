//
//  WeatherCell.h
//  Meteorology
//
//  Created by QiMENG on 15/1/7.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"
@interface WeatherCell : UITableViewCell {
    
    __weak IBOutlet UIImageView *bgImageView;
    
    
}

@property (nonatomic, strong) WeatherModel * model;


@end
