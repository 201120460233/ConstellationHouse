//
//  NSAttributedString+EX.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/9.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "NSAttributedString+EX.h"

@implementation NSAttributedString (EX)

+ (NSMutableAttributedString *)transWithString:(NSString *)str colorAttributeName:(NSArray *)colorAttriArr lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:str];
    //设置颜色
    for (NSDictionary *dic in colorAttriArr) {
        [attStr addAttribute:NSForegroundColorAttributeName value:dic[@"color"] range:NSRangeFromString(dic[@"range"])];
    }
    //设置行间距
    if (lineSpace > 0.) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = lineSpace;
        [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    }
    return attStr;
}

@end
