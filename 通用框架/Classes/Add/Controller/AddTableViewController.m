//
//  AddTableViewController.m
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width / 2 -15
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height / 2 - 40
#define KScreenX              [[UIScreen mainScreen] bounds].size.width /2 +2
#define KScreenY               80
#define Kx                     self.view.frame.size.width -31

#import "AddTableViewController.h"
#import "Addtable.h"
#import "AddTableViewCell.h"
@interface AddTableViewController ()
@property (nonatomic,strong) NSMutableArray *array;
@end
static NSString *cells = @"cell";
@implementation AddTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeTop;
    [self.tableView registerClass:[AddTableViewCell class] forCellReuseIdentifier:cells];
    self.view.frame = CGRectMake(KScreenX, KScreenY, kScreenWidth, kScreenHeight);
    self.automaticallyAdjustsScrollViewInsets = false;
    UIImageView *imv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"YellowDownArrow"]];
    imv.frame = CGRectMake(Kx , -2, 20, 20);
    imv.transform =CGAffineTransformMakeRotation(M_PI);
    [self.view addSubview:imv];

}

-(NSMutableArray *)array{
    if (_array == nil) {
        //获取json路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"more_project.json" ofType:nil];
        //转化成二进制数据
        NSData *data = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
        //将二进制转换成数组
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *arrayM = [NSMutableArray array];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Addtable *addtable = [Addtable addtableWithDict:obj];
            [arrayM addObject:addtable];
        }];
        _array = arrayM;
    }
    return _array;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}
- (AddTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cells forIndexPath:indexPath];
    Addtable *addmodel = self.array[indexPath.row];
    cell.model = addmodel;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}



// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//     //Return NO if you do not want the specified item to be editable.
//    return YES;
//}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.array removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }   
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

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
