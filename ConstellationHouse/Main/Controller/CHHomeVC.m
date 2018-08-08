//
//  CHHomeVC.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/6.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "CHHomeVC.h"
#import "CHDefine.h"
#import "Masonry.h"
#import "CHSearchVC.h"
#import "CHFortuneVC.h"
#import "CHPairVC.h"
#import "CHAstrolabeVC.h"
#import "CHZodiacVC.h"

@interface CHHomeVC ()

@property (nonatomic, strong) UIImageView *bgImgView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) NSMutableDictionary *dataDic;

@end

@implementation CHHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy load
- (UIImageView *)bgImgView {
    if (nil == _bgImgView) {
        _bgImgView = [[UIImageView alloc] init];
    }
    return _bgImgView;
}

- (UIView *)bgView {
    if (nil == _bgView) {
        _bgView = [[UIView alloc] init];
    }
    return _bgView;
}

- (NSMutableDictionary *)dataDic {
    if (nil == _dataDic) {
        _dataDic = [NSMutableDictionary dictionary];
    }
    return _dataDic;
}

#pragma mark - Private method
- (void)initData {
    self.dataDic[@"icon"] = @[@"search", @"fortune", @"pair", @"astrolabe", @"zodiac"];
    self.dataDic[@"title"] = @[@"星座查询", @"星座运势", @"星座配对", @"星盘", @"十二生肖"];
}

- (void)setupUI {
    self.title = @"星座屋";
    
    [self.view addSubview:self.bgImgView];
    self.bgImgView.image = [UIImage imageNamed:@"bgImg.jpg"];
    self.bgImgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.height.equalTo(self.view);
    }];
    
    
    [self.view addSubview:self.bgView];
    self.bgView.backgroundColor = UIColorFromRGBA(0xffffff, .2);
    self.bgView.layer.cornerRadius = 10.f;
    self.bgView.layer.masksToBounds = YES;
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(460);
    }];
    
    UIButton *btn0;
    NSArray *arr = self.dataDic[@"icon"];
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
//        [btn setTitle:self.dataDic[@"title"][i] forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [btn setTag:i];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i % 2 == 0) {
                make.right.equalTo(self.bgView.mas_centerX).offset(-15);
            }else {
                make.left.equalTo(self.bgView.mas_centerX).offset(15);
            }
            if (btn0) {
                if (i % 2 == 0) {
                   make.top.equalTo(btn0.mas_bottom).offset(30);
                }else {
                    make.top.equalTo(btn0);
                }
            }else {
                make.top.equalTo(self.bgView).offset(50);
            }
            make.width.height.mas_equalTo(100);
        }];
        btn0 = btn;
    }
}

- (void)btnClicked:(UIButton *)sender {
    NSLog(@"clicked index:%ld ", (long)sender.tag);
    switch (sender.tag) {
        case 0:{
            CHSearchVC *vc = [[CHSearchVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            CHFortuneVC *vc = [[CHFortuneVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            CHPairVC *vc = [[CHPairVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            CHAstrolabeVC *vc = [[CHAstrolabeVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
            CHZodiacVC *vc = [[CHZodiacVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
