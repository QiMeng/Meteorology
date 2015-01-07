//
//  WeatherCell.m
//  Meteorology
//
//  Created by QiMENG on 15/1/7.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "WeatherCell.h"
#import "QMService.h"
#import <UIImageView+ProgressView.h>

@implementation WeatherCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(WeatherModel *)model {
    
    _model = model;
    
    NSString * imageStr = [NSString stringWithFormat:kImageHost,model.imgStr0];
    
    DLog(@"%@",imageStr);
    
    [bgImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] usingProgressView:nil];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
