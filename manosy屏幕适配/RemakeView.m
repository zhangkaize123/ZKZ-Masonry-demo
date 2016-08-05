//
//  RemakeView.m
//  manosy屏幕适配
//
//  Created by 张凯泽 on 16/8/5.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "RemakeView.h"
#import "Masonry.h"
@interface RemakeView()
@property(nonatomic,strong)UIButton *removingBtn;
@property (nonatomic, assign) BOOL topLeft;
@end
@implementation RemakeView
-(instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.removingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.removingBtn.backgroundColor = [UIColor greenColor];
    [self.removingBtn addTarget:self action:@selector(removingClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.removingBtn];
    self.topLeft = YES;
    return self;
}
+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}
-(void)updateConstraints
{
    [self.removingBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
        
        if (self.topLeft) {
            make.left.equalTo(self).with.offset(10);
            
            make.top.equalTo(self).with.offset(70);
        }
        else {
            make.bottom.equalTo(self).with.offset(-10);
            make.right.equalTo(self).with.offset(-10);
        }

    }];
   

    
    [super updateConstraints];
}
-(void)removingClick
{
    self.topLeft = !self.topLeft;
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];

}
@end
