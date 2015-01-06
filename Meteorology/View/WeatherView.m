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
    
    if (!iconBackgroundImageView) {
        iconBackgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - iconHeight, 0, iconHeight, iconHeight)];
        iconBackgroundImageView.backgroundColor = [UIColor blueColor];
        [self addSubview:iconBackgroundImageView];
        
        iconImageView = [[UIImageView alloc]initWithFrame:iconBackgroundImageView.bounds];
        iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        iconImageView.clipsToBounds = YES;
        [iconBackgroundImageView addSubview:iconImageView];
        
        UIView * line0 = [[UIView alloc]initWithFrame:CGRectMake(0, iconBackgroundImageView.maxY-1, iconBackgroundImageView.width, 1)];
        line0.backgroundColor = [UIColor whiteColor];
        [iconBackgroundImageView addSubview:line0];
    }
    
    {
        if (!weatherImageView) {
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
            
            
            UIView * line0 = [[UIView alloc]initWithFrame:CGRectMake(weatherImageView.maxX-1, 0, 1, weatherImageView.height)];
            line0.backgroundColor = [UIColor whiteColor];
            [weatherImageView addSubview:line0];
            
            
            UIButton * infoBtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
            infoBtn.frame = CGRectMake(weatherImageView.maxX, iconBackgroundImageView.maxY, iconBackgroundImageView.width, weatherImageView.height-iconBackgroundImageView.maxY);
            
            [infoBtn addTarget:self action:@selector(touchInfoBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:infoBtn];
            
            
        }

    }
}


- (void)setModel:(WeatherModel *)model {
    
    _model = model;
    
    weatherTempLabel.text = [NSString stringWithFormat:@"%@ ~ %@",_model.temp0,_model.temp1];
//    weatherTempLabel.text = _model.temp0;
    cityLabel.text = _model.city;
    
    int r = arc4random() % 3;
    
    NSString * iconStr = @"";
    NSString * bgStr = @"";
    
    switch (r) {
        case 0:
        {
            iconStr = @"http://qimeng.github.io/phone/imgs/113.jpg";
            bgStr = @"http://qimeng.github.io/phone/imgs/113.jpg";
        }
            break;
        case 1:
        {
            iconStr = @"http://qimeng.github.io/phone/imgs/000.gif";
            bgStr = @"http://qimeng.github.io/phone/imgs/111.jpg";
        }
            break;
        case 2:
        {
            iconStr = @"http://qimeng.github.io/phone/imgs/112.jpg";
            bgStr = @"http://qimeng.github.io/phone/imgs/114.jpg";
        }
            break;
        case 3:
        {
            iconStr = @"http://qimeng.github.io/phone/imgs/dock.png";
            bgStr = @"http://qimeng.github.io/phone/imgs/IMG_00011.JPG";
        }
            break;
        case 4:
        {
            iconStr = @"http://qimeng.github.io/phone/imgs/IMG_0066.JPG";
            bgStr = @"http://qimeng.github.io/phone/imgs/IMG_0077.JPG";
        }
            break;
        case 5:
        {
            iconStr = @"http://qimeng.github.io/phone/imgs/IMG_0078.JPG";
            bgStr = @"http://qimeng.github.io/phone/imgs/IMG_0079.JPG";
        }
            break;
        case 6:
        {
            iconStr = @"http://qimeng.github.io/phone/imgs/IMG_0105.JPG";
            bgStr = @"http://qimeng.github.io/phone/imgs/IMG_00481.JPG";
        }
            break;
            
        default:
            break;
    }
    
    
    [weatherImageView sd_setImageWithURL:[NSURL URLWithString:iconStr]];
    
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:bgStr]];
    
    [self transitionView];

}

#pragma mark - 翻转的动画效果
- (void)transitionView {
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(0.0);
    anim.toValue = @(1.0);
    [self pop_addAnimation:anim forKey:@"fade"];
    
    
//    CATransition *t = [CATransition animation];
//	t.type = @"flip";
//	t.subtype = kCATransitionFromLeft;
//	t.duration = 0.25;
//	t.removedOnCompletion = YES;
//    [self.layer addAnimation:t forKey:@"flip"];
    
}


- (void)touchInfoBtn:(id)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(weatherViewCallInfo:)]) {
        [_delegate weatherViewCallInfo:_model];
    }
    
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
