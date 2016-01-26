//
//  HomeController.m
//  通用框架
//
//  Created by Jusive on 16/1/11.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "HomeController.h"
#import "MainController.h"
#import "HomeModel.h"
#import "HomeTableViewCell.h"
#import "AddTableViewController.h"
#import "coverView.h"
@interface HomeController ()
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) MainController *main;
@property (nonatomic,strong) AddTableViewController *addTabview;
@property (nonatomic,strong) coverView *myView;
@property (nonatomic,assign) Boolean new;
@property (nonatomic,assign) Boolean open;

@end
static NSString *ID = @"cell";
@implementation HomeController
//-(coverView *)myView{
//    if (_myView == nil) {
//        
//    }
//    return _myView;
//}
-(AddTableViewController *)addTabview{
    if (_addTabview == nil) {
        _addTabview = [AddTableViewController new];
    }
    return _addTabview;
}
-(NSArray *)array{
    if (_array == nil) {
        
        //获取json
        NSString *path = [[NSBundle mainBundle]pathForResource:@"products.json" ofType:nil];
        //将json转换成data
        NSData *data = [NSData dataWithContentsOfFile:path];
        //将json转化成数组
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *arrayM = [NSMutableArray array];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HomeModel *model = [HomeModel homeWithDic:obj];
            [arrayM addObject:model];
        }];
        _array = arrayM;
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    MainController *mainview = [MainController new];
    self.main = [mainview sharedmainViewController];
    [self viewAppear];
    _myView = [[coverView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _myView.alpha = 0.9;
    _myView.backgroundColor = [UIColor redColor];
    [self.navigationController addChildViewController:self.addTabview];
    
}
-(void)viewAppear{
    UIBarButtonItem *LeftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"qq"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButton)];
    self.navigationItem.leftBarButtonItem = LeftBarButtonItem;
    UIBarButtonItem *RightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButton)];
    self.navigationItem.rightBarButtonItem = RightBarButtonItem;
}

-(void)leftBarButton{
    switch (self.open) {
        case NO:
   [[self.main sharedmainViewController] openLeftView];
            self.open = YES;
            break;
         case YES:
            self.open = NO;
    [[self.main sharedmainViewController] closeLeftView];
            break;
        default:
            break;
    }
    
}
-(void)rightBarButton{
      switch (self.new) {
        case NO:
            [self.navigationController.view addSubview:_addTabview.view];
            [self.view addSubview:self.myView];
            self.new = YES;
            break;
        case YES:
            self.new = NO;
            [self.addTabview.view removeFromSuperview];
            break;
        default:
            break;
    }
}
-(void)removeview{
    [_myView removeFromSuperview];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
}


-(HomeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
     HomeModel *home = self.array[indexPath.row];
   cell.backgroundColor = [UIColor whiteColor];
    cell.home = home;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
