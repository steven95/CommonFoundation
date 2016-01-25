
//
//  MssageNavigationViewController.m
//  通用框架
//
//  Created by Jusive on 16/1/20.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "MssageNavigationViewController.h"
#import "MessageController.h"
@interface MssageNavigationViewController ()
@property (nonatomic,strong)MssageNavigationViewController *MssageNavigationViewController;
@end

@implementation MssageNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MessageController *MessTableViewController = [[MessageController alloc]initWithStyle:UITableViewStylePlain];
    MessTableViewController.view.frame = [UIScreen mainScreen].bounds;
    self.MssageNavigationViewController =[self initWithRootViewController:MessTableViewController];
    
    [self visibleViewController];
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
