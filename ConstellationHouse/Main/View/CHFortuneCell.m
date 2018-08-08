//
//  CHFortuneCell.m
//  ConstellationHouse
//
//  Created by shuni on 2018/8/8.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "CHFortuneCell.h"
#import "ConstellationModel.h"
#import "Masonry.h"

@interface CHFortuneCell()

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *dateLabel;

@end

@implementation CHFortuneCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 8.f;
        self.layer.masksToBounds = YES;
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.dateLabel];
    }
    return self;
}

#pragma mark - Lazy load
- (UIImageView *)imgView {
    if (nil == _imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.layer.cornerRadius = 40.f;
        _imgView.layer.masksToBounds = YES;
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgView;
}

- (UILabel *)nameLabel {
    if (nil == _nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UILabel *)dateLabel {
    if (nil == _dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = [UIColor blueColor];
        _dateLabel.font = [UIFont systemFontOfSize:14];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLabel;
}

#pragma mark - Private method
- (void)configModel:(ConstellationModel *)cModel {
    self.imgView.image = [UIImage imageNamed:cModel.icon];
    self.nameLabel.text = cModel.name;
    self.dateLabel.text = cModel.dateStr;
    [self.nameLabel sizeToFit];
    [self.dateLabel sizeToFit];
    [self layoutAllSubviews];
}

- (void)layoutAllSubviews {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.width.height.mas_equalTo(80);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.contentView);
        make.top.equalTo(self.imgView.mas_bottom).offset(5);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.width.mas_equalTo(100);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
    }];
}

@end
