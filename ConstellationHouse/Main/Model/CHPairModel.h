//
//  CHPairModel.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/13.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHPairModel : NSObject

@property (nonatomic, strong) NSString *male;
@property (nonatomic, strong) NSString *female;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSArray *moreArray;

- (instancetype)initWithDic:(NSDictionary*)dic;

@end
