//
//  UserDetailViewController.h
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailViewController : UIViewController

@property (nonatomic,strong) NSString * userID;
@property (nonatomic,strong) NSString * name;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)loadUserPosts;

@end
