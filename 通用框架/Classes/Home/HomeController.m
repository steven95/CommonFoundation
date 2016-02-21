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
#import "minview.h"
#import "refreshControl.h"
@interface HomeController ()<UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) MainController *main;
@property (nonatomic,strong) AddTableViewController *addTabview;
@property (nonatomic,strong) coverView *myView;
@property (nonatomic,strong) minview *minView;
@property (nonatomic,assign) Boolean new;
@property (nonatomic,assign) Boolean open;
@end
static NSString *ID = @"cell";
@implementation HomeController

-(coverView *)myView{
    if (_myView == nil) {
        _myView = [[coverView alloc]initWithFrame:self.tableView.bounds];
        _myView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.2];
    }
    return _myView;
}
-(AddTableViewController *)addTabview{
    if (_addTabview == nil) {
        _addTabview = [AddTableViewController new];
    }
    return _addTabview;
}

-(void)setArray:(NSMutableArray *)array{
    _array = array;
    [self.tableView reloadData];
}

-(void)setUrlString:(NSString *)urlString{
    self.array = nil;
    [HomeModel homeModelWithstring:urlString Success:^(NSMutableArray *array) {
        self.array = array;
        [self.refreshControl endRefreshing];
    } errorBlock:^(NSError *errer) {
        [self.refreshControl endRefreshing];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    MainController *mainview = [MainController new];
    self.main = [mainview sharedmainViewController];
    [self viewAppear];
    [self.navigationController addChildViewController:self.addTabview];
    //此代码可以解决tabbar透明的问题,要记住了
     self.edgesForExtendedLayout = UIRectEdgeNone;
     _minView = [[minview alloc]initWithFrame:CGRectMake(0, 0, 100, 650)];
     _minView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.1];
      [self setUrlString:nil];
    self.refreshControl = [refreshControl new];
    [self.refreshControl addTarget:self action:@selector(pull) forControlEvents:UIControlEventValueChanged];
}
-(void)pull{
  [self.view setNeedsDisplay];
  [self setUrlString:nil];
    [self.refreshControl endRefreshing];
}
-(void)viewAppear{
    UIBarButtonItem *LeftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"qq"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButton)];
    self.navigationItem.leftBarButtonItem = LeftBarButtonItem;
    UIBarButtonItem *RightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButton)];
    self.navigationItem.rightBarButtonItem = RightBarButtonItem;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(rightBarButton) name:@"close" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(leftBarButton) name:@"minclose" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(add) name:@"add" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(rem) name:@"rem" object:nil];
}


-(void)add{
    
   [self.view addSubview:_minView];
    self.open = YES;
    }
-(void)rem{
    [_minView removeFromSuperview];
    self.open = NO;
}
-(void)leftBarButton{
    switch (self.open) {
        case NO:
    [self.view addSubview:_minView];
          [[self.main sharedmainViewController] openLeftView];
        self.open = YES;
            break;
         case YES:
            self.open = NO;
    [[self.main sharedmainViewController] closeLeftView];
         [_minView removeFromSuperview];
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
              [self.myView removeFromSuperview];
            break;
        default:
            break;
    }
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
    return 80;
}
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
//}
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}
// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}

// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
////                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [self.array removeObjectAtIndex:[indexPath row]];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
//}
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}

//
//
//
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.array removeObjectAtIndex:indexPath.row];
//        // Delete the row from the data source.
//        [tableView deleteRowsAtIndexPaths:@[indexPath]  withRowAnimation:UITableViewRowAnimationFade];
//        
//    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
//    
//    
//}
//
//
//
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//    
//}
//

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
