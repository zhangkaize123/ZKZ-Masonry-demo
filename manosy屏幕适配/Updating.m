//
//  Updating.m
//  manosy屏幕适配
//
//  Created by 张凯泽 on 16/8/4.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "Updating.h"
#import "Masonry.h"
@interface Updating()
@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) CGSize buttonSize;
@end
@implementation Updating

-(instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.growingButton.backgroundColor = [UIColor greenColor];
    [self.growingButton addTarget:self action:@selector(didTapGrowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.growingButton];
    
     self.buttonSize = CGSizeMake(100, 100);
    return self;
}
+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}
- (void)updateConstraints {
    
//    [self.growingButton updateConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self);
//        make.width.equalTo(@(self.buttonSize.width)).priorityLow();
//        make.height.equalTo(@(self.buttonSize.height)).priorityLow();
//        make.width.lessThanOrEqualTo(self);
//        make.height.lessThanOrEqualTo(self);
//    }];
    
    [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
        //make.center.mas_equalTo(self.center);
        make.center.equalTo(self);
        make.width.mas_equalTo(self.buttonSize.width);
        make.height.mas_equalTo(self.buttonSize.height);
        make.width.mas_lessThanOrEqualTo(self.mas_width).priorityHigh();
        make.height.mas_lessThanOrEqualTo(self.mas_height).priorityHigh();
    }];
    [super updateConstraints];
}
-(void)didTapGrowButton:(UIButton*)button
{
     self.buttonSize = CGSizeMake(self.buttonSize.width * 1.3, self.buttonSize.height * 1.3);
    NSLog(@"点击按钮");
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];

}
@end
