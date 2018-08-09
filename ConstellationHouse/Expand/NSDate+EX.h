//
//  NSDate+EX.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/8.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (EX)

- (int)returnMonth:(NSDate *)date;
- (int)returnDay:(NSDate *)date;
- (NSString *)getAstroWithMonth:(int)m day:(int)d;
- (NSString *)getConstellationWithDate:(NSString *)dateStr;
- (NSString *)stringWithFormate:(NSString *)form;

@end
