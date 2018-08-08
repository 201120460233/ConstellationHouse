//
//  CHSearchVC.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/6.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "CHSearchVC.h"
#import "Masonry.h"
#import "CHDefine.h"
#import "CHConfig.h"
#import "CHSearchResultVC.h"
#import "Toast.h"


@interface CHSearchVC ()

@property (nonatomic, strong) UIButton *selDateBtn;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation CHSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"星座查询";
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)selDateBtn {
    if (nil == _selDateBtn) {
        _selDateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _selDateBtn;
}

- (UIButton *)searchBtn {
    if (nil == _searchBtn) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _searchBtn;
}

- (UIDatePicker *)datePicker {
    if (nil == _datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.date = [NSDate date];
        _datePicker.maximumDate = [NSDate date];
        [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}


#pragma mark - Private method
- (void)setupUI {
    self.selDateBtn.layer.cornerRadius = 32.f;
    self.selDateBtn.layer.masksToBounds = YES;
    self.selDateBtn.backgroundColor = [UIColor whiteColor];
    [self.selDateBtn setTitle:@"请选择出生日期" forState:UIControlStateNormal];
    [self.selDateBtn setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
    [self.selDateBtn addTarget:self action:@selector(selDateBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.selDateBtn];
    [self.selDateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(64);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(60);
    }];
    
    self.searchBtn.layer.cornerRadius = 32.f;
    self.searchBtn.layer.masksToBounds = YES;
    self.searchBtn.backgroundColor = [UIColor whiteColor];
    [self.searchBtn setTitle:@"开始查询" forState:UIControlStateNormal];
    [self.searchBtn setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(searchBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchBtn];
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(64);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.selDateBtn.mas_bottom).offset(40);
    }];
    
    self.datePicker.hidden = YES;
    [self.view addSubview:_datePicker];
    [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.width.equalTo(self.view);
        make.height.mas_equalTo(300);
    }];
    
}


- (void)selDateBtnClicked {
    self.datePicker.hidden = NO;
}

- (void)searchBtnClicked {
    if ([self.selDateBtn.titleLabel.text isEqualToString:@"请选择出生日期"]) {
        [self.view makeToast:@"请选择出生日期再查询" duration:1.f position:CSToastPositionCenter];
        return;
    }
    self.datePicker.hidden = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CHSearchResultVC *vc = [[CHSearchResultVC alloc] init];
        vc.dateStr = self.selDateBtn.titleLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    });
}

- (void)dateChanged:(UIDatePicker *)datePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置时间格式
    formatter.dateFormat = @"yyyy年MM月dd日";
    NSString *dateStr = [formatter  stringFromDate:datePicker.date];
    [self.selDateBtn setTitle:dateStr forState:UIControlStateNormal];
    [self.selDateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
