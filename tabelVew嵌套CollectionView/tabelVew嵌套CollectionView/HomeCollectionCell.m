//
//  HomeCollectionCell.m
//  tabelVew嵌套CollectionView
//
//  Created by anan on 2017/7/6.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import "HomeCollectionCell.h"
#define ITEM_HEIGHT (SCREEN_HEIGHT*2/3-4)/5
@implementation HomeCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:20];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.myView = [[UIView alloc]init];
        self.myView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.myView];
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageView];
        
        self.textLabel = [[UILabel alloc] init];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat wi = 28 ;
    self.myView.frame  = CGRectMake(0.5, 0.5, self.frame.size.width-1,self.frame.size.width-1);
    self.imageView.frame = CGRectMake((self.frame.size.width - wi)/2, (self.frame.size.height - wi - 10  - 20)/2, wi, wi);
    self.textLabel.frame = CGRectMake(0, _imageView.frame.origin.y + 38, self.frame.size.width, 20);
    
}

@end
