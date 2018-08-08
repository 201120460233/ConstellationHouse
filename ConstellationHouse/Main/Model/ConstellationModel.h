//
//  ConstellationModel.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/8.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstellationModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) NSArray *moreArray;

- (instancetype)initWithDic:(NSDictionary*)dic;

@end
