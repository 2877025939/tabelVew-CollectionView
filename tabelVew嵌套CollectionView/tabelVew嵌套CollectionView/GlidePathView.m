//
//  TopScrollView.m
//  HUD
//
//  Created by anan on 2017/8/22.
//  Copyright © 2017年 Plan. All rights reserved.
//

//应用程序的屏幕高度
#define SCRH        [UIScreen mainScreen].bounds.size.height
//应用程序的屏幕宽度
#define SCRW        [UIScreen mainScreen].bounds.size.width
#define Height      self.frame.size.height

#import "GlidePathView.h"
@interface GlidePathView (){
    CGFloat _y;
}

@property (nonatomic,strong)UILabel *lable;
@end

@implementation GlidePathView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _y = frame.origin.y + Height;
        
        [self creatUI:frame];
    }
    return self;
}

-(void)creatUI:(CGRect)frame{
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.masksToBounds = YES;
    
    
    self.lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCRW, Height)];
    self.lable.backgroundColor = [UIColor clearColor];
    self.lable.textAlignment = NSTextAlignmentCenter;
    self.lable.numberOfLines= 0;
    self.lable.textColor = [UIColor blueColor];
    [self addSubview:self.lable];
    
    self.hidden = YES;
    
}
-(void)showAnimated:(NSString*)str{
    
   self.lable.text = str;
    
    [UIView animateWithDuration:1.0f animations:^{
        self.hidden = NO;
        self.frame  = CGRectMake(0, _y, SCRW, Height);
        
    } completion:^(BOOL finished) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.frame = CGRectMake(0, _y-Height, SCRW, Height);
                
            } completion:^(BOOL finished) {
                
                self.hidden = YES;
                
            }];
        });
        
    }];
}


@end
