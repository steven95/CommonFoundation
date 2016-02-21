//
//  MessageController.m
//  通用框架
//  
//  Created by Jusive on 16/1/11.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "MessageController.h"
#import "MessageTableViewCell.h"
#import "MessageTabbarViewController.h"
#import "MainTabBarButton.h"
#import "MainController.h"
@interface MessageController ()<UITableViewDataSource>

@end
static NSString *MessageCell = @"MessageCell";
@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewAppear];
    [self tabBarBtn];
   [self.tableView registerClass:[MessageTableViewCell class] forCellReuseIdentifier:MessageCell];
}

-(void)tabBarBtn{
     MessageTabbarViewController *messtabB = [MessageTabbarViewController new];
//    [self addChildViewController:messtabB];
    messtabB =[messtabB sharedmessTabBarController];
    MainTabBarButton *btn = [MainTabBarButton new];
    [btn image:UIImageRenderingModeAlwaysOriginal imageName:@"xingxing" imageHightName:@"xingxing" index:0];
    messtabB.tabBar.backgroundColor = [UIColor blueColor];
    [messtabB.tabBar addSubview:btn];
}
-(void)viewAppear{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"homeTableViewCell"];
    self.navigationItem.title = @"Message";
    UIBarButtonItem *LeftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tabbar_more"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButton)];
    self.navigationItem.leftBarButtonItem = LeftBarButtonItem;
}
-(void)leftBarButton{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
//}
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}


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
