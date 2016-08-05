//
//  BaseView.m
//  manosy屏幕适配
//
//  Created by 张凯泽 on 16/8/4.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "BaseView.h"
#import "Masonry/Masonry.h"
@implementation BaseView

-(instancetype)init
{
    self = [super init];
    if (!self) return nil;
    UIView * yellowView = [[UIView alloc]init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self addSubview:yellowView];
    
    UIView * greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self addSubview:greenView];
    
    UIView * redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self addSubview:redView];
    
    UIView * superView = self;
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
       
         make.top.mas_equalTo(self.mas_top).offset(80);
        
        make.left.mas_equalTo(superView.mas_left).offset(10);
        //make.centerX.mas_equalTo(superView.mas_centerX);
        make.right.mas_equalTo(greenView.mas_left).offset(-10);
        //make.bottom.mas_equalTo(superView.mas_centerY).offset(0);
        make.bottom.mas_equalTo(redView.mas_top).offset(-10);
        make.width.mas_equalTo(greenView.mas_width);
        make.height.mas_equalTo(greenView.mas_height);
        make.height.mas_equalTo(redView.mas_height);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(superView.mas_top).offset(80);
        make.right.mas_equalTo(superView.mas_right).offset(-10);
        make.left.mas_equalTo(yellowView.mas_right).offset(10);
        make.bottom.mas_equalTo(redView.mas_top).offset(-10);
        //make.bottom.mas_equalTo(superView.mas_centerY).offset(0);
        make.width.mas_equalTo(yellowView.mas_width);
        make.height.mas_equalTo(yellowView.mas_height);
    }];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(yellowView.mas_bottom).offset(10);
        make.left.mas_equalTo(yellowView.mas_left);
        make.right.mas_equalTo(greenView.mas_right);
        make.bottom.mas_equalTo(superView.mas_bottom).offset(-10);
        make.height.mas_equalTo(yellowView.mas_height);
    }];
    return self;

}

@end
