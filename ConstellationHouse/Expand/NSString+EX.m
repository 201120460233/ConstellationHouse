//
//  NSString+EX.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/9.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "NSString+EX.h"

@implementation NSString (EX)

// 正则判断手机号码格式
+ (BOOL)validatePhone:(NSString *)phone {
    /**
     *  手机号码
     2017-4-9日更新的手机号段：
     移动号段：
     134 135 136 137 138 139 147 150 151 152 157 158 159 172 178 182 183 184 187 188
     联通号段：
     130 131 132 145 155 156 171 175 176 185 186
     电信号段：
     133 149 153 173 177 180 181 189
     虚拟运营商:
     170
     //下面是old
     *  移动：134[0-8],13[5-9],15[0-1],15[7-9],178,18[2-4],18[7-8]
     *  联通：13[0-2],152,15[5-6],171,17[5-6],18[5-6]
     *  电信：133,1349,153,173,177,18[0-1],189
     */
    /*
    NSString *MOBILERegex = @"^1(3[0-9]|4[579]|5[0-35-9]|7[0-35-8]|8[0-9])\\d{8}$";
    NSString *CMRegex = @"^1(3[4-9]|47|5[0127-9]|7[28]|8[2-478])\\d{8}$";
    NSString *CURegex = @"^1(3[0-2]|45|5[56]|7[156]|8[56])\\d{8}$";
    NSString *CTRegex = @"^1(33|49|53|7[37]|8[019])\\d{8}$";
    
    NSPredicate *mobilePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILERegex];
    NSPredicate *cmPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CMRegex];
    NSPredicate *cuPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CURegex];
    NSPredicate *ctPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CTRegex];
    
    BOOL res1 = [mobilePred evaluateWithObject:phone];
    BOOL res2 = [cmPred evaluateWithObject:phone];
    BOOL res3 = [cuPred evaluateWithObject:phone];
    BOOL res4 = [ctPred evaluateWithObject:phone];
    
    if (res1 || res2 || res3 || res4) {
        if (res2) {
            NSLog(@"China Mobile");
        } else if(res3) {
            NSLog(@"China Unicom");
        } else if (res4) {
            NSLog(@"China Telecom");
        } else {
            NSLog(@"Unknow");
        }
        return YES;
    } else {
        return NO;
    }
    */
    // 初略匹配
    NSString *MOBILERegex = @"^1(3|4|5|7|8)\\d{9}$";
    NSPredicate *mobilePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILERegex];
    return [mobilePred evaluateWithObject:phone];
}

+ (BOOL)validateQQ:(NSString *)qqStr {
    // QQ：5位数以上字且第一位不为0
    NSString *qqRegex = @"^[1-9][0-9]\\d{5,}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", qqRegex];
    return [pred evaluateWithObject:qqStr];
}

+ (BOOL)validateWX:(NSString *)wxStr {
    // 微信号：6-20位数字、英文、下划线或减号，且第一位为字母 （注意：没设置微信号的系统会自动生成，只能用绑定的手机号或者qq号进行判断）
    NSString *wxRegex = @"^[a-zA-Z]{1}[\\da-zA-Z_-]{5,19}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", wxRegex];
    return [pred evaluateWithObject:wxStr];
}

+ (BOOL)validateIDCardNumber:(NSString *)cardNum {
    /*
    if (cardNum.length != 18) return NO;
    // 正则表达式判断基本 身份证号是否满足格式
    NSString *regex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(![identityStringPredicate evaluateWithObject:cardNum]) return NO;
    
    //开始进行校验//
    //将前17位加权因子保存在数组里
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    
    //用来保存前17位各自乖以加权因子后的总和
    NSInteger idCardWiSum = 0;
    for(int i = 0;i < 17;i++) {
        NSInteger subStrIndex = [[cardNum substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum+= subStrIndex * idCardWiIndex;
    }
    
    //计算出校验码所在数组的位置
    NSInteger idCardMod=idCardWiSum%11;
    //得到最后一位身份证号码
    NSString *idCardLast= [cardNum substringWithRange:NSMakeRange(17, 1)];
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if(idCardMod==2) {
        if(![idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
            return NO;
        }
    }else{
        //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
        if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
            return NO;
        }
    }
    return YES;
    */
    //只做粗略判断
    if (cardNum.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:cardNum];
}

///是否包含emoji表情
-(BOOL)containEmoji
{
    NSUInteger len = [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    if (len < 3) {  // 大于2个字符需要验证Emoji(有些Emoji仅三个字符)
        return NO;
    }
    
    // 仅考虑字节长度为3的字符,大于此范围的全部做Emoji处理
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    Byte *bts = (Byte *)[data bytes];
    Byte bt;
    short v;
    for (NSUInteger i = 0; i < len; i++) {
        bt = bts[i];
        
        if ((bt | 0x7F) == 0x7F) {  // 0xxxxxxx  ASIIC编码
            continue;
        }
        if ((bt | 0x1F) == 0xDF) {  // 110xxxxx  两个字节的字符
            i += 1;
            continue;
        }
        if ((bt | 0x0F) == 0xEF) {  // 1110xxxx  三个字节的字符(重点过滤项目)
            // 计算Unicode下标
            v = bt & 0x0F;
            v = v << 6;
            v |= bts[i + 1] & 0x3F;
            v = v << 6;
            v |= bts[i + 2] & 0x3F;
            
            //            NSLog(@"%02X%02X", (Byte)(v >> 8), (Byte)(v & 0xFF));
            
            if ([self emojiInSoftBankUnicode:v] || [self emojiInUnicode:v]) {
                return YES;
            }
            
            i += 2;
            continue;
        }
        if ((bt | 0x3F) == 0xBF) {  // 10xxxxxx  10开头,为数据字节,直接过滤
            continue;
        }
        
        return YES;                 // 不是以上情况的字符全部超过三个字节,做Emoji处理
    }
    
    return NO;
}

- (BOOL) emojiInUnicode:(short)code
{
    if (code == 0x0023
        || code == 0x002A
        || (code >= 0x0030 && code <= 0x0039)
        || code == 0x00A9
        || code == 0x00AE
        || code == 0x203C
        || code == 0x2049
        || code == 0x2122
        || code == 0x2139
        || (code >= 0x2194 && code <= 0x2199)
        || code == 0x21A9 || code == 0x21AA
        || code == 0x231A || code == 0x231B
        || code == 0x2328
        || code == 0x23CF
        || (code >= 0x23E9 && code <= 0x23F3)
        || (code >= 0x23F8 && code <= 0x23FA)
        || code == 0x24C2
        || code == 0x25AA || code == 0x25AB
        || code == 0x25B6
        || code == 0x25C0
        || (code >= 0x25FB && code <= 0x25FE)
        || (code >= 0x2600 && code <= 0x2604)
        || code == 0x260E
        || code == 0x2611
        || code == 0x2614 || code == 0x2615
        || code == 0x2618
        || code == 0x261D
        || code == 0x2620
        || code == 0x2622 || code == 0x2623
        || code == 0x2626
        || code == 0x262A
        || code == 0x262E || code == 0x262F
        || (code >= 0x2638 && code <= 0x263A)
        || (code >= 0x2648 && code <= 0x2653)
        || code == 0x2660
        || code == 0x2663
        || code == 0x2665 || code == 0x2666
        || code == 0x2668
        || code == 0x267B
        || code == 0x267F
        || (code >= 0x2692 && code <= 0x2694)
        || code == 0x2696 || code == 0x2697
        || code == 0x2699
        || code == 0x269B || code == 0x269C
        || code == 0x26A0 || code == 0x26A1
        || code == 0x26AA || code == 0x26AB
        || code == 0x26B0 || code == 0x26B1
        || code == 0x26BD || code == 0x26BE
        || code == 0x26C4 || code == 0x26C5
        || code == 0x26C8
        || code == 0x26CE
        || code == 0x26CF
        || code == 0x26D1
        || code == 0x26D3 || code == 0x26D4
        || code == 0x26E9 || code == 0x26EA
        || (code >= 0x26F0 && code <= 0x26F5)
        || (code >= 0x26F7 && code <= 0x26FA)
        || code == 0x26FD
        || code == 0x2702
        || code == 0x2705
        || (code >= 0x2708 && code <= 0x270D)
        || code == 0x270F
        || code == 0x2712
        || code == 0x2714
        || code == 0x2716
        || code == 0x271D
        || code == 0x2721
        || code == 0x2728
        || code == 0x2733 || code == 0x2734
        || code == 0x2744
        || code == 0x2747
        || code == 0x274C
        || code == 0x274E
        || (code >= 0x2753 && code <= 0x2755)
        || code == 0x2757
        || code == 0x2763 || code == 0x2764
        || (code >= 0x2795 && code <= 0x2797)
        || code == 0x27A1
        || code == 0x27B0
        || code == 0x27BF
        || code == 0x2934 || code == 0x2935
        || (code >= 0x2B05 && code <= 0x2B07)
        || code == 0x2B1B || code == 0x2B1C
        || code == 0x2B50
        || code == 0x2B55
        || code == 0x3030
        || code == 0x303D
        || code == 0x3297
        || code == 0x3299
        // 第二段
        || code == 0x23F0) {
        return YES;
    }
    return NO;
}

/**
 * 一种非官方的, 采用私有Unicode 区域
 * e0 - e5  01 - 59
 */
- (BOOL) emojiInSoftBankUnicode:(short)code
{
    return ((code >> 8) >= 0xE0 && (code >> 8) <= 0xE5 && (Byte)(code & 0xFF) < 0x60);
}

- (BOOL)startWithChineseCharacter {
    for(int i = 0; i < self.length; i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff) {
            NSLog(@"汉字");
            return YES;
        }
    }
    return NO;
}

//过滤掉标点符号
-(NSString*)filtermark
{
//    [NSCharacterSet alphanumericCharacterSet];          //所有数字和字母(大小写)
//    [NSCharacterSet decimalDigitCharacterSet];          //0-9的数字
//    [NSCharacterSet letterCharacterSet];                //所有字母
//    [NSCharacterSet lowercaseLetterCharacterSet];       //小写字母
//    [NSCharacterSet uppercaseLetterCharacterSet];       //大写字母
//    [NSCharacterSet punctuationCharacterSet];           //标点符号
//    [NSCharacterSet whitespaceAndNewlineCharacterSet];  //空格和换行符
//    [NSCharacterSet whitespaceCharacterSet];            //空格
    
    NSMutableCharacterSet * set = [NSMutableCharacterSet punctuationCharacterSet];
    //可以在这里加额外的指定符号
    [set addCharactersInString:@"<>^"];
    //可以加快捷的格式,空格和回车
    [set formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray *setArr = [self componentsSeparatedByCharactersInSet:set];
    NSString *resultStr1 = [setArr componentsJoinedByString:@""];
    return resultStr1;
}

- (CGSize)sizeWithMaxW:(CGFloat)maxW font:(UIFont *)font {
    CGSize size = CGSizeMake(maxW, MAXFLOAT);
    NSDictionary *textAttrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size;
}

///**
// * 计算文字高度，可以处理计算带行间距的
// */
//- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing {
//    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineSpacing = lineSpacing;
//    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
//    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
//    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
//    CGRect rect = [attributeString boundingRectWithSize:size options:options context:nil];
//    return rect.size;
//}

/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:size options:options context:nil];
    
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((rect.size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if (![self containChinese:self]) {  //如果不包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height+paragraphStyle.lineSpacing);
        }
    }
    return rect.size;
}
//判断如果包含中文
- (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){ int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

- (CGFloat)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines
{
    if (maxLines <= 0) {
        return 0;
    }
    
    CGFloat maxHeight = font.lineHeight * maxLines + lineSpacing * (maxLines - 1);
    
    CGSize orginalSize = [self boundingRectWithSize:size font:font lineSpacing:lineSpacing];
    
    if ( orginalSize.height >= maxHeight ) {
        return maxHeight;
    }else{
        return orginalSize.height;
    }
}

- (BOOL)isMoreThanOneLineWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing
{
    if ( [self boundingRectWithSize:size font:font lineSpacing:lineSpacing].height > font.lineHeight  ) {
        return YES;
    }else{
        return NO;
    }
}

/**
 * 传入行间距和font为文本设置富文本属性
 */
- (NSAttributedString *)getAttributedStringWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    return attributedString;
}

@end
