//
//  HomeTitle.m
//  tabelVew嵌套CollectionView
//
//  Created by anan on 2017/6/9.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import "HomeTitle.h"
#import "Masonry.h"
@implementation HomeTitle


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createUI];
    }
    return self;
}

-(void)createUI{
    
    
    [self addSubview:self.titleLable];
    
    [self addSubview:self.line];
    
    [self addSubview:self.mine];
    
    [self.mine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(20);
        make.size.mas_equalTo(CGSizeMake(44, 44));
        
    }];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.left.right.bottom.equalTo(self);
    }];
    
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable.mas_bottom).offset(-0.3);
        make.left.right.bottom.equalTo(self);
    }];
}
//按钮事件
-(void)test:(UIButton *)sender{
    
    NSLog(@"button");
    //实现代码块
    if (self.btnClick) {
        
        self.btnClick();
    }
}


-(UILabel *)titleLable{
    
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.backgroundColor = [UIColor clearColor];
        _titleLable.textColor = [UIColor whiteColor];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.font =  [UIFont fontWithName:@"Helvetica-Bold" size:20];
        _titleLable.text =@"plan";

    }
    return _titleLable;
}

-(UILabel *)line{
    
    if (!_line) {
        _line = [[UILabel alloc]init];
        _line.backgroundColor = [UIColor clearColor];
        
    }
    return _line;
}

-(UIButton *)mine{
    
    if (!_mine) {
        _mine = [[UIButton alloc]init];
        [_mine setImage:[UIImage imageNamed:@"111"] forState:UIControlStateNormal];
        [_mine addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _mine;
}



@end
