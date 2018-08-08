//
//  UIViewController+NavigationBar.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/6.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "CHDefine.h"

@implementation UIViewController (NavigationBar)

- (void)loadBarTitle:(NSString *)title {
    [self loadBarTitle:title withTextColor:UIColorFromRGB(0x160e12) font:18.];
}

- (void)loadBarTitle:(NSString*)title withTextColor:(UIColor *)color font:(CGFloat)font {
    self.navigationItem.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font],
                                                                      NSForegroundColorAttributeName: color}];
}

- (UIButton *)loadItemWithImage:(UIImage *)image target:(id)target action:(SEL)action position:(CHBarItemPostion)position {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    [self loadItemWithCustomView:btn position:position];
    return btn;
}

- (UIButton *)loadItemWithNorImage:(NSString *)nImage selImage:(NSString *)sImage  target:(id)target action:(SEL)action position:(CHBarItemPostion)position {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:nImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:sImage] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:sImage] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    [self loadItemWithCustomView:btn position:position];
    return btn;
}

- (NSArray *)loadItemWithImage1:(NSString *)img1 image2:(NSString *)img2 taeget:(id)target action1:(SEL)action1 action2:(SEL)action2 position:(CHBarItemPostion)position {
    if (position == CHBarItemPostionLeft) {
        self.navigationItem.leftBarButtonItems  = nil;
    } else {
        self.navigationItem.rightBarButtonItems  = nil;
    }
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:img1] forState:UIControlStateNormal];
    [btn1 addTarget:target action:action1 forControlEvents:UIControlEventTouchUpInside];
    [btn1 sizeToFit];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:img2] forState:UIControlStateNormal];
    [btn2 addTarget:target action:action2 forControlEvents:UIControlEventTouchUpInside];
    [btn2 sizeToFit];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceBarButtonItem.width = 15;
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    
    if (position == CHBarItemPostionLeft) {
        self.navigationItem.leftBarButtonItems = @[item1, fixedSpaceBarButtonItem, item2];
        return @[item1, fixedSpaceBarButtonItem, item2];
    }else {
        self.navigationItem.rightBarButtonItems = @[item2, fixedSpaceBarButtonItem, item1];
        return @[item2, fixedSpaceBarButtonItem, item1];
    }
}

- (NSArray *)loadItemWithTitle1:(NSString *)title1 title2:(NSString *)title2 taeget:(id)target action1:(SEL)action1 action2:(SEL)action2 position:(CHBarItemPostion)position {
    if (position == CHBarItemPostionLeft) {
        self.navigationItem.leftBarButtonItems  = nil;
    } else {
        self.navigationItem.rightBarButtonItems  = nil;
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:title1 forState:UIControlStateNormal];
    [btn addTarget:target action:action1 forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn2 setTitle:title2 forState:UIControlStateNormal];
    [btn2 addTarget:target action:action2 forControlEvents:UIControlEventTouchUpInside];
    [btn2 sizeToFit];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceBarButtonItem.width = 15;
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    
    if (position == CHBarItemPostionLeft) {
        self.navigationItem.leftBarButtonItems = @[item1, fixedSpaceBarButtonItem, item2];
        return @[item1, fixedSpaceBarButtonItem, item2];
    }else {
        self.navigationItem.rightBarButtonItems = @[item2, fixedSpaceBarButtonItem, item1];
        return @[item2, fixedSpaceBarButtonItem, item1];
    }
}


- (UIButton *)loadItemWithTitle:(NSString *)title textColor:(UIColor *)color font:(CGFloat)font target:(id)target action:(SEL)action position:(CHBarItemPostion)position {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIColor *titleColor = color ? color : [UIColor whiteColor];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    [self loadItemWithCustomView:btn position:position];
    return btn;
}

- (void)loadItemWithCustomView:(UIView *)view position:(CHBarItemPostion)position {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target: nil action:nil];
    
    if (position == CHBarItemPostionLeft) {
        negativeSpacer.width = -15;
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            if (btn.titleLabel.text.length > 0 && btn.imageView.image) {
                negativeSpacer.width = -5;
            }
        }
        self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, item, nil];
        //        self.navigationItem.leftBarButtonItem = item;
    }else if (position == CHBarItemPostionRight) {
        negativeSpacer.width = -8;
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, item, nil];
        //        self.navigationItem.rightBarButtonItem = item;
    }
}


@end
