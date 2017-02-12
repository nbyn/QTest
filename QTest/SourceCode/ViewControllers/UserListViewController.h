//
//  UserListViewController.h
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)loadUsers;

@end
