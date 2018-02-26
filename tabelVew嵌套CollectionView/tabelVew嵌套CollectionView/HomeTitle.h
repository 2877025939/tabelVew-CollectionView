//
//  HomeTitle.h
//  tabelVew嵌套CollectionView
//
//  Created by anan on 2017/6/9.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTitle : UIView
@property (nonatomic,strong) UILabel *titleLable;
@property (nonatomic,strong) UIButton *mine;
@property (nonatomic,strong) UILabel *line;

//声明mine按钮
@property(nonatomic,copy)void(^btnClick)();
@end
