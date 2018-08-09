//
//  NSDate+EX.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/8.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "NSDate+EX.h"

@implementation NSDate (EX)

/**
 *  返回月份
 *  @param date 时间
 *  @return 月份
 */
- (int)returnMonth:(NSDate *)date {
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return [currentDateStr intValue];
}

/**
 *  返回天
 *  @param date 时间
 *  @return 天
 */
- (int)returnDay:(NSDate *)date {
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return [currentDateStr intValue];
}

/**
 *  计算星座
 *  @param m 月份
 *  @param d 日期
 *  @return 结果
 */
- (NSString *)getAstroWithMonth:(int)m day:(int)d {
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    if (m < 1 || m > 12 || d < 1 || d > 31) {
        return @"错误日期格式!";
    }
    if (m == 2 && d > 29) {//2月份
        return @"错误日期格式!!";
    }else if(m == 4 || m == 6 || m == 9 || m == 11) {
        if (d > 30) {
            return @"错误日期格式!!!";
        }
    }
    result = [NSString stringWithFormat:@"%@座", [astroString substringWithRange:NSMakeRange(m * 2-(d < [[astroFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19)) * 2,2)]];
    return result;
}

/**
 *  获得星座的方法
 *  @param dateStr 日期字符串
 *  @return 星座
 */
- (NSString *)getConstellationWithDate:(NSString *)dateStr {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy年MM月dd日"];//设定时间格式,要注意跟下面的dateString匹配，否则日起将无效
    NSDate *selectdate = [dateFormat dateFromString:dateStr];
    NSString *constellation = [self getAstroWithMonth:[self returnMonth:selectdate] day:[self returnDay:selectdate]];
    return constellation;
}

/**
 *  获取时间格式化字符串
 *  @param form 格式化样式
 *  @return 时间字符串
 */
- (NSString *)stringWithFormate:(NSString *)form {
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    formate.dateFormat = form;
    NSString *string = [formate stringFromDate:self];
    if (string.length) {
        return string;
    }
    return @"";
}

@end
