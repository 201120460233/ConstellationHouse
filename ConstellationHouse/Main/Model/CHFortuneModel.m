//
//  CHFortuneModel.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/9.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "CHFortuneModel.h"

@implementation CHFortuneModel

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"",@"dateStr",
                             @"",@"integrateIndex",
                             @"",@"integrateDesc",
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
            if ([key isEqualToString:@"dateStr"]) {
                mutDic[@"dateStr"] = [NSString stringWithFormat:@"%@", dic[@"dateStr"]];
            }else if ([key isEqualToString:@"integrateIndex"]) {
                mutDic[@"integrateIndex"] = [NSString stringWithFormat:@"%@", dic[@"integrateIndex"]];
            }else if ([key isEqualToString:@"integrateDesc"]) {
                mutDic[@"integrateDesc"] = [NSString stringWithFormat:@"%@", dic[@"integrateDesc"]];
            }else if ([key isEqualToString:@"more"]) {
                mutDic[@"moreArray"] = [NSArray arrayWithArray:dic[@"more"]];
            }
        }
        [self setValuesForKeysWithDictionary:mutDic];
    }
    return self;
}

@end
