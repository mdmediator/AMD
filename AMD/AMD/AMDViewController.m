//
//  AViewController.m
//  MainProject
//
//  Created by casa on 2016/12/10.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "AMDViewController.h"
#import <B_Category/CTMediator+B.h>
#import <HandyFrame/UIView+LayoutMethods.h>

@interface AViewController ()

@property (nonatomic, strong) UIButton *pushBViewControllerButton;

@end

@implementation AViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pushBViewControllerButton];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.pushBViewControllerButton sizeToFit];
    [self.pushBViewControllerButton centerEqualToView:self.view];
}

#pragma mark - event response
- (void)didTappedPushBViewControllerButton:(UIButton *)button
{
    
    UIViewController *controller =[[CTMediator sharedInstance] B_viewControllerWithContentText:@"你是好样的"];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - getters and setters
- (UIButton *)pushBViewControllerButton
{
    if (_pushBViewControllerButton == nil) {
        _pushBViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushBViewControllerButton setTitle:@"push B view controller" forState:UIControlStateNormal];
        [_pushBViewControllerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_pushBViewControllerButton addTarget:self action:@selector(didTappedPushBViewControllerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBViewControllerButton;
}

@end

