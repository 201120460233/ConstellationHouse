//
//  NSAttributedString+EX.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/9.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (EX)

+ (NSMutableAttributedString *)transWithString:(NSString *)str colorAttributeName:(NSArray *)colorAttriArr lineSpace:(CGFloat)lineSpace;

@end
