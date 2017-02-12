//
//  UserListViewController.m
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import "UserListViewController.h"

#import "WebServiceManager.h"
#import "UIView+Toast.h"
#import "UserListCell.h"
#import "UserModel.h"
#import "UserDetailViewController.h"

@interface UserListViewController() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray * userListArray;

@end

@implementation UserListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tableView.estimatedRowHeight = 44.0f;
    
    UIRefreshControl *refreshController = [[UIRefreshControl alloc] init];
    [refreshController addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [_tableView addSubview:refreshController];
    
    _userListArray = [NSMutableArray array];
    
    [self loadUsers];
    
}

- (void)handleRefresh:(UIRefreshControl *)refreshController {
    
    [self loadUsers];
    
    [refreshController endRefreshing];
}

# pragma mark - Web Service Calls

- (void)loadUsers {
    
    [[WebServiceManager sharedInstance]getRequest:kUserList controllerView:self.view
                                  completionBlock:^(id response, NSError *error){
                                      
                                      if (error != nil){
                                          [self.view makeToast:[NSString stringWithFormat:@"%@",[error localizedDescription]]];
                                          return;
                                      }
                                      for (NSDictionary * userInfo in (NSArray*)response){
                                          UserModel * user = [[UserModel alloc]initWithUserInfo:userInfo];
                                          [_userListArray addObject:user];
                                      }
                                      [self.tableView reloadData];
                                      
                                  }];
}

# pragma mark - UITableView Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _userListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserListCell *cell = (UserListCell *)[tableView dequeueReusableCellWithIdentifier:@"UserListCell"];
    
    UserModel * user = _userListArray[indexPath.row];
    cell.nameLabel.text = user.name;
    cell.userNameLabel.text = user.userName.lowercaseString;
    cell.emailAddressLabel.text = user.emailAddress.lowercaseString;
    cell.addressLabel.text = user.address;
    
    return cell;
}

# pragma mark - UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserModel * user = _userListArray[indexPath.row];
    
    UserDetailViewController * detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetailViewController"];
    detailViewController.userID = [user.userID stringValue];
    detailViewController.name = user.name;
    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
