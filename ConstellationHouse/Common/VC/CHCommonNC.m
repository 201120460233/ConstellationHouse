//
//  CHCommonNC.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/6.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "CHCommonNC.h"
#import "CHDefine.h"
#import "UIViewController+NavigationBar.h"

@interface CHCommonNC ()

@end

@implementation CHCommonNC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: UIColorFromRGB(0xffffff), NSForegroundColorAttributeName, nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
