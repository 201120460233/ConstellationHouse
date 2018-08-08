//
//  CHBaseVC.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/6.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHBaseVC : UIViewController

//统一的返回按钮
- (UIButton *)loadBackBtn;
- (UITableView *)addNormalList;
- (UITableView *)addNormalListWithStyle:(UITableViewStyle)style;
- (UIScrollView *)addNormalScrollView;

@end
