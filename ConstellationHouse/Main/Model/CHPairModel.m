//
//  CHPairModel.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/13.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "CHPairModel.h"

@implementation CHPairModel

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"",@"male",
                             @"",@"female",
                             @"",@"desc",
                             @[],@"moreArray",
                             nil];
        return [self initWithDic:dic];
    }
    return self;
}

///初始化
- (instancetype)initWithDic:(NSDictionary*)dic {
    self = [super init];
    if (self) {
        NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
        for (NSString *key in dic.allKeys) {
            if ([key isEqualToString:@"male"]) {
                mutDic[@"male"] = [NSString stringWithFormat:@"%@", dic[@"male"]];
            }else if ([key isEqualToString:@"female"]) {
                mutDic[@"female"] = [NSString stringWithFormat:@"%@", dic[@"female"]];
            }else if ([key isEqualToString:@"desc"]) {
                mutDic[@"desc"] = [NSString stringWithFormat:@"%@", dic[@"desc"]];
            }else if ([key isEqualToString:@"more"]) {
                mutDic[@"moreArray"] = [NSArray arrayWithArray:dic[@"more"]];
            }
        }
        [self setValuesForKeysWithDictionary:mutDic];
    }
    return self;
}

@end
