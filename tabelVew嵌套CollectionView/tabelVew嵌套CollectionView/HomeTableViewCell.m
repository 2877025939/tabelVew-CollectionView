//
//  HomeTableViewCell.m
//  tabelVew嵌套CollectionView
//
//  Created by anan on 2017/6/9.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import "HomeTableViewCell.h"

#import "HomeCollectionCell.h"
#import "ViewController1.h"
// 宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface HomeTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>



@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        
        _headLable = [[UILabel alloc]init];
        _headLable.userInteractionEnabled = NO;
        _headLable.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_headLable];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/4, SCREEN_WIDTH/4);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        
        //注册cell
        [_collectionView registerClass:[HomeCollectionCell class] forCellWithReuseIdentifier:@"cell"];
        [self.contentView addSubview:self.collectionView];
        
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _headLable.frame = CGRectMake(0, 0, SCREEN_WIDTH, 35);
    _headLable.text = [NSString stringWithFormat:@"  %@",self.headText];
    
    NSInteger collectionViewCount = self.collectDataArray.count;
    
    //这里要计算一下每一个cell里面collectionView的count
    if (collectionViewCount == 0) {
        
        self.collectionView.frame = CGRectMake(0 , 35, SCREEN_WIDTH , 0 );
    } else if (collectionViewCount >= 1 && collectionViewCount <= 4){
        
        self.collectionView.frame = CGRectMake(0 , 35, SCREEN_WIDTH , SCREEN_WIDTH/4 );
    } else if (collectionViewCount > 4 && collectionViewCount <= 8){
        
        self.collectionView.frame = CGRectMake(0 , 35, SCREEN_WIDTH , SCREEN_WIDTH*2/4 );
    } else if (collectionViewCount > 8 && collectionViewCount <= 12){
        
        self.collectionView.frame = CGRectMake(0 , 35, SCREEN_WIDTH , SCREEN_WIDTH*3/4 );
    }
    
    
}


#pragma mark -- Collection delegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.collectDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.collectDataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"MyTask@2x"];
    
    return cell;
}


#pragma mark -- Collection delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了 %ld ", indexPath.row);
    
    if([self.delegate respondsToSelector:@selector(CustomCollection:didSelectRowAtIndexPath:str:)]){
        
        [self.delegate CustomCollection:collectionView didSelectRowAtIndexPath:indexPath str:self.collectDataArray[indexPath.row]];
    }
    
    
}


@end
