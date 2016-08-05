//
//  ViewController.m
//  manosy屏幕适配
//
//  Created by 张凯泽 on 16/8/4.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
//#import "Masonry.h"
@interface ViewController ()
@property (nonatomic, strong) Class viewClass;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (id)initWithTitle:(NSString *)title viewClass:(Class)viewClass {
    self = [super init];
    if (!self) return nil;
    
    self.title = title;
    self.viewClass = viewClass;
    
    return self;
}

- (void)loadView {
    self.view = self.viewClass.new;
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
