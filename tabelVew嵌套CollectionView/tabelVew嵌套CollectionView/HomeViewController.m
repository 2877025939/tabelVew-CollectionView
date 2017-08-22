//
//  HomeViewController.m
//  tabelVew嵌套CollectionView
//
//  Created by anan on 2017/6/9.
//  Copyright © 2017年 Plan. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "ViewController1.h"
#import "HomeTitle.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,CustomCollectionDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSArray *array1;
@property (nonatomic,strong)HomeTitle *homeTitle;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
}

-(void)createUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets=NO;

    [self.view addSubview:self.tableView];
    
    _homeTitle = [[HomeTitle alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    
    [self.view addSubview:_homeTitle];
    
    
    __weak typeof(self) weakSelf = self;
    
    weakSelf.homeTitle.btnClick = ^{
        [weakSelf click:weakSelf];
    };
    
    
}

-(void)click:(UIViewController *)obj{
    
    NSLog(@"点击了个人");
    ViewController1 *mine = [[ViewController1 alloc]init];
    
    [self.navigationController pushViewController:mine animated:YES];
    
}



#pragma mark -  tableView 代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier =@"HomeTableViewCell";
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.delegate = self;
    
    cell.collectDataArray = self.dataArray[indexPath.section];
    
    cell.headText = self.array1[indexPath.section];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}



#pragma mark - 代理方法
- (void)CustomCollection:(UICollectionView *)collectionView didSelectRowAtIndexPath:(NSIndexPath *)indexPath str:(NSString *)str{
    
    NSLog(@"select: %ld", indexPath.row);
    NSLog(@"str=%@",str);
    
    ViewController1 *vc = [[ViewController1 alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger collectionViewCount = [self.dataArray[indexPath.section] count];
    
    return  [self collectionViewCount:collectionViewCount];
    
}

-(CGFloat)collectionViewCount:(NSInteger)collectionViewCount{
    
    if (collectionViewCount == 0) {
        
        return 0;
    } else if (collectionViewCount >= 1 && collectionViewCount <= 4){
        
        return 35 +SCREEN_WIDTH/4;
        
    } else if (collectionViewCount > 4 && collectionViewCount <= 8){
        
        return  35 +SCREEN_WIDTH*2/4 ;
    }
    return 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y  < 0) {
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        
    }else if (scrollView.contentOffset.y  >=64) {

        _homeTitle.backgroundColor = [UIColor whiteColor];
        _homeTitle.titleLable.textColor = [UIColor blackColor];
        _homeTitle.line.backgroundColor = [UIColor blackColor];
        [_homeTitle.mine setImage:[UIImage imageNamed:@"1111"] forState:UIControlStateNormal] ;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
        
    } else{
        
        _homeTitle.backgroundColor = [UIColor clearColor];
        _homeTitle.titleLable.textColor = [UIColor whiteColor];
        _homeTitle.line.backgroundColor = [UIColor clearColor];
        [_homeTitle.mine setImage:[UIImage imageNamed:@"111"] forState:UIControlStateNormal] ;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if (self.tableView.contentOffset.y >64) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0 , SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.backgroundColor =[UIColor whiteColor];
        _tableView.dataSource =self;
        _tableView.delegate = self;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"HomeTableViewCell"];
        
        UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        headerView.image = [UIImage imageNamed:@"风景1.jpg"];
        _tableView.tableHeaderView = headerView;
        
        [_tableView reloadData];
    }
    
    return _tableView;
    
}
-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        _dataArray = (NSMutableArray*)@[@[@"01",@"02",@"03",@"04",@"05"] ,@[@"11",@"12",@"13",@"14"] , @[@"21",@"22",@"23"],@[@"31",@"32",@"33"],@[@"41",@"42",@"43"],@[@"51",@"52",@"53"]];
        
    }
    return _dataArray;
}
-(NSArray *)array1{
    
    if (!_array1 ) {
        _array1 = [NSArray array];
        _array1 = @[@"标题0",@"标题1",@"标题2",@"标题3",@"标题4",@"标题5"];
    }
    return _array1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
