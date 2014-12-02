//
//  WeatherView.m
//  Meteorology
//
//  Created by QiMENG on 14-12-3.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "WeatherView.h"
#import <UIView+CBFrameHelpers.h>
@implementation WeatherView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    weatherImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.height, self.height)];
    
    [self addSubview:weatherImageView];
    
    iconBackgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.height, 0, self.width - self.width, self.width - self.height)];
    
    iconImageView = [[UIImageView alloc]initWithFrame:iconImageView.bounds];
    [iconBackgroundImageView addSubview:iconImageView];
    
    [self addSubview:iconBackgroundImageView];
    
    
    
    
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
