//
//  UserDetailViewController.m
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import "UserDetailViewController.h"


#import "WebServiceManager.h"
#import "UIView+Toast.h"
#import "UserDetailCell.h"
#import "UserModel.h"

@interface UserDetailViewController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * userPostsArray;

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@ Posts",_name];
    
    _tableView.estimatedRowHeight = 44.0f;
    
    UIRefreshControl *refreshController = [[UIRefreshControl alloc] init];
    [refreshController addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [_tableView addSubview:refreshController];
    
    _userPostsArray = [NSMutableArray array];
    
    [self loadUserPosts];
    
}

- (void)handleRefresh:(UIRefreshControl *)refreshController {
    
    [self loadUserPosts];
    
    [refreshController endRefreshing];
}

# pragma mark - Web Service Calls

- (void)loadUserPosts {
    
    NSString * urlString = [NSString stringWithFormat:@"%@%@",kUserDetail,_userID];
    
    [[WebServiceManager sharedInstance]getRequest:urlString controllerView:self.view
                                  completionBlock:^(id response, NSError *error){
                                      
                                      if (error != nil){
                                          [self.view makeToast:[NSString stringWithFormat:@"%@",[error localizedDescription]]];
                                          return;
                                      }
                                      _userPostsArray = response;
                                      [self.tableView reloadData];
                                  }];
}

# pragma mark - UITableView Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _userPostsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserDetailCell *cell = (UserDetailCell *)[tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
    
    NSDictionary * userPostInfo = _userPostsArray[indexPath.row];
    
    cell.postTitleLabel.text = [userPostInfo objectForKey:@"title"] != nil ?
                                [userPostInfo[@"title"]capitalizedString] : @"";
    
    cell.postBodyTextView.text = [userPostInfo objectForKey:@"body"] != nil ?
                                    userPostInfo[@"body"] : @"";

    return cell;
}

@end
