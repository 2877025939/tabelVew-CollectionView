//
//  HomeTableViewCell.h
//  tabelVew嵌套CollectionView
//
//  Created by anan on 2017/6/9.
//  Copyright © 2017年 Plan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomCollectionDelegate <NSObject>

- (void)CustomCollection:(UICollectionView *)collectionView didSelectRowAtIndexPath:(NSIndexPath *)indexPath str:(NSString*)str;

@end
@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, assign) id<CustomCollectionDelegate> delegate;
@property (nonatomic,strong) UILabel *headLable;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *collectDataArray;
@property (nonatomic,copy) NSString *headText;


@end

