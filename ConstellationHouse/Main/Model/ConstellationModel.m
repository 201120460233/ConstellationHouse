//
//  ConstellationModel.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/8.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "ConstellationModel.h"

@implementation ConstellationModel

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"",@"name",
                             @"",@"icon",
                             @"",@"dateStr",
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
            if ([key isEqualToString:@"icon"]) {
                mutDic[@"icon"] = [NSString stringWithFormat:@"%@", dic[@"icon"]];
            }else if ([key isEqualToString:@"date"]) {
                mutDic[@"dateStr"] = [NSString stringWithFormat:@"%@", dic[@"date"]];
            }else if ([key isEqualToString:@"name"]) {
                mutDic[@"name"] = [NSString stringWithFormat:@"%@", dic[@"name"]];
            }else if ([key isEqualToString:@"more"]) {
                mutDic[@"moreArray"] = [NSArray arrayWithArray:dic[@"more"]];
            }
        }
        [self setValuesForKeysWithDictionary:mutDic];
    }
    return self;
}

@end
