//
//  NSString+Extension.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/9.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (EX)

+ (BOOL)validatePhone:(NSString *)phoneStr;
+ (BOOL)validateQQ:(NSString *)qqStr;
+ (BOOL)validateWX:(NSString *)wxStr;
+ (BOOL)validateIDCardNumber:(NSString *)cardNum;

///是否包含emoji表情
-(BOOL)containEmoji;

//是否以中文开头
- (BOOL)startWithChineseCharacter;

//过滤掉标点符号
-(NSString*)filtermark;


/**
 计算一行文字高度

 @param maxW 最大宽度
 @param font 字号
 @return 高度
 */
- (CGSize)sizeWithMaxW:(CGFloat)maxW font:(UIFont *)font;

/**
 计算多行文字高度，可以处理计算带行间距的

 @param size 文字的最大宽度和最大高度，高度不选可以选择MAXFLOAT
 @param font 字号
 @param lineSpacing 行间距
 @return 文字的大小
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing;


/**
 计算最大行数文字高度,可以处理计算带行间距的

 @param size 文字的最大宽度和最大高度
 @param font 字号
 @param lineSpacing 间距
 @param maxLines 行数
 @return 高度
 */
- (CGFloat)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines;


/**
 计算是否超过一行

 @param size 文字的最大宽度和最大高度
 @param font 字号
 @param lineSpacing 间距
 @return 是否超过一行
 */
- (BOOL)isMoreThanOneLineWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing;

/**
 * 传入行间距和font为文本设置富文本属性
 */
- (NSAttributedString *)getAttributedStringWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;

@end
