//
//  TableViewListController.m
//  manosy屏幕适配
//
//  Created by 张凯泽 on 16/8/4.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "TableViewListController.h"
#import "ViewController.h"
#import "BaseView.h"
#import "Updating.h"
#import "RemakeView.h"
#import "KeyBoardView.h"
static NSString * const kMASCellReuseIdentifier = @"kMASCellReuseIdentifier";
@interface TableViewListController ()
@property (nonatomic, strong) NSArray *exampleControllers;

@end

@implementation TableViewListController

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.title = @"Examples";
    
    self.exampleControllers = @[
                                [[ViewController alloc] initWithTitle:@"Basic"
                                                                      viewClass:BaseView.class],
                                [[ViewController alloc] initWithTitle:@"Updating"
                                                                      viewClass:Updating.class],
                                [[ViewController alloc] initWithTitle:@"Remake"
                                                                      viewClass:RemakeView.class],
                                [[ViewController alloc] initWithTitle:@"键盘遮挡"
                                                                      viewClass:KeyBoardView.class]
//                                [[ViewController alloc] initWithTitle:@"Composite Edges"
//                                                                      viewClass:MASExampleSidesView.class],
//                                [[ViewController alloc] initWithTitle:@"Aspect Fit"
//                                                                      viewClass:MASExampleAspectFitView.class],
//                                [[ViewController alloc] initWithTitle:@"Basic Animated"
//                                                                      viewClass:MASExampleAnimatedView.class],
//                                [[ViewController alloc] initWithTitle:@"Debugging Helpers"
//                                                                      viewClass:MASExampleDebuggingView.class],
//                                [[ViewController alloc] initWithTitle:@"Bacony Labels"
//                                                                      viewClass:MASExampleLabelView.class],
//                                [[ViewController alloc] initWithTitle:@"UIScrollView"
//                                                                      viewClass:MASExampleScrollView.class],
//                                [[ViewController alloc] initWithTitle:@"Array"
//                                                                      viewClass:MASExampleArrayView.class],
//                                [[ViewController alloc] initWithTitle:@"Attribute Chaining"
//                                                                      viewClass:MASExampleAttributeChainingView.class],
//                                [[ViewController alloc] initWithTitle:@"Margins"
//                                                                      viewClass:MASExampleMarginView.class],
//                                [[ViewController alloc] initWithTitle:@"Views Distribute"
//                                                                      viewClass:MASExampleDistributeView.class],
                                
                                ];
    
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:kMASCellReuseIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMASCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewController.title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleControllers.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
