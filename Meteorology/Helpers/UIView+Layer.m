//
//  UIView+Layer.m
//  Meteorology
//
//  Created by QiMENG on 14-12-1.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (Layer)

#pragma mark - 圆角 & 边框
- (void)setRadius:(CGFloat)radiu BorderWidth:(CGFloat)width BorderColor:(UIColor *)color {
    
    self.layer.cornerRadius = radiu;
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];

}


@end
