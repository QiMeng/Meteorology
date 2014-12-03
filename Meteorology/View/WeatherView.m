//
//  WeatherView.m
//  Meteorology
//
//  Created by QiMENG on 14-12-3.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "WeatherView.h"
#import <UIView+CBFrameHelpers.h>
#import "UIView+Layer.h"

#import <UIImageView+ProgressView.h>

@implementation WeatherView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
    }
    return self;
}

- (void)awakeFromNib {
    
    [self setUI];
    
}

- (void)setUI {
    
    [self setRadius:10 BorderWidth:0 BorderColor:nil];
    self.clipsToBounds = YES;

    float iconHeight = self.height * (2/3.0);
    
    
    iconBackgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - iconHeight, 0, iconHeight, iconHeight)];
    iconBackgroundImageView.backgroundColor = [UIColor blueColor];
    
    [self addSubview:iconBackgroundImageView];
    
    iconImageView = [[UIImageView alloc]initWithFrame:iconBackgroundImageView.bounds];
    [iconBackgroundImageView addSubview:iconImageView];
    
    [self addSubview:iconBackgroundImageView];

    
    
    weatherImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width - iconHeight, self.height)];
    weatherImageView.backgroundColor = [UIColor redColor];
    weatherImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:weatherImageView];
 
    
}


- (void)setModel:(WeatherModel *)model {
    
    _model = model;
    
    [weatherImageView sd_setImageWithURL:[NSURL URLWithString:@"http://qimeng.github.io/phone/imgs/IMG_00011.JPG"] usingProgressView:nil];
    
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
