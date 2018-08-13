//
//  CHPairDetailVC.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/13.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "CHBaseVC.h"
@class ConstellationModel;

@interface CHPairDetailVC : CHBaseVC

@property (nonatomic, strong) ConstellationModel *leftModel;
@property (nonatomic, strong) ConstellationModel *rightModel;

@end
