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

#import <POP.h>



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

    
    {
        weatherImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width - iconHeight, self.height)];
        weatherImageView.backgroundColor = [UIColor redColor];
        weatherImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:weatherImageView];
 
        weatherTempLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, weatherImageView.width, weatherImageView.height *(2/3.0))];
        [weatherImageView addSubview:weatherTempLabel];
        weatherTempLabel.textColor = [UIColor whiteColor];
        weatherTempLabel.textAlignment = NSTextAlignmentCenter;
        weatherTempLabel.font = [UIFont boldSystemFontOfSize:25];
        
        
        
        cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, weatherTempLabel.maxY, weatherImageView.width, weatherImageView.height * (1/3.0))];
        [weatherImageView addSubview:cityLabel];
        cityLabel.textColor = [UIColor whiteColor];
        cityLabel.textAlignment = NSTextAlignmentCenter;
        cityLabel.font = [UIFont boldSystemFontOfSize:14];
    }
    
    
    
    
}


- (void)setModel:(WeatherModel *)model {
    
    _model = model;
    
    weatherTempLabel.text = [NSString stringWithFormat:@"%@ ~ %@",_model.temp0,_model.temp1];
//    weatherTempLabel.text = _model.temp0;
    cityLabel.text = _model.city;
    
    [weatherImageView sd_setImageWithURL:[NSURL URLWithString:@"http://qimeng.github.io/phone/imgs/113.jpg"]];
    
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:@"http://qimeng.github.io/phone/imgs/114.jpg"]];
    
    [self transitionView];

}

#pragma mark - 翻转的动画效果
- (void)transitionView {
    
    CATransition *t = [CATransition animation];
	t.type = @"flip";
	t.subtype = kCATransitionFromLeft;
	t.duration = 0.25;
	t.removedOnCompletion = YES;
    [self.layer addAnimation:t forKey:@"flip"];
    
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
