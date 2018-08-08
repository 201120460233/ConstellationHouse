//
//  UIViewController+NavigationBar.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/6.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHConfig.h"

@interface UIViewController (NavigationBar)

- (void)loadBarTitle:(NSString *)title;
- (void)loadBarTitle:(NSString*)title withTextColor:(UIColor *)color font:(CGFloat)font;
- (UIButton *)loadItemWithImage:(UIImage *)image target:(id)target action:(SEL)action position:(CHBarItemPostion)position;
- (NSArray *)loadItemWithImage1:(NSString *)img1 image2:(NSString *)img2 taeget:(id)target action1:(SEL)action1 action2:(SEL)action2 position:(CHBarItemPostion)position;
- (NSArray *)loadItemWithTitle1:(NSString *)title1 title2:(NSString *)title2 taeget:(id)target action1:(SEL)action1 action2:(SEL)action2 position:(CHBarItemPostion)position;
- (UIButton *)loadItemWithTitle:(NSString *)title textColor:(UIColor *)color font:(CGFloat)font target:(id)target action:(SEL)action position:(CHBarItemPostion)position;
- (void)loadItemWithCustomView:(UIView *)view position:(CHBarItemPostion)position;
- (UIButton *)loadItemWithNorImage:(NSString *)nImage selImage:(NSString *)sImage target:(id)target action:(SEL)action position:(CHBarItemPostion)position;

@end
