//
//  MainController.h
//  通用框架
//
//  Created by Jusive on 16/1/24.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainController : UIViewController
-(MainController *)sharedmainViewController;
-(void)openLeftView;
- (void)closeLeftView;
@end
