//
//  CHFortuneModel.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/9.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHFortuneModel : NSObject

@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) NSString *integrateIndex;
@property (nonatomic, strong) NSString *integrateDesc;
@property (nonatomic, strong) NSArray *moreArray;

- (instancetype)initWithDic:(NSDictionary*)dic;

@end


