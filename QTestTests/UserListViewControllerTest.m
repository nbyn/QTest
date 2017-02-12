//
//  UserListViewControllerTest.m
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserListViewController.h"
#import "UserListCell.h"
#import "UserModel.h"

@interface UserListViewControllerTest : XCTestCase

@property (nonatomic, strong) UserListViewController *userListViewController;


@end

@implementation UserListViewControllerTest

- (void)setUp {
    [super setUp];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.userListViewController = [storyboard instantiateViewControllerWithIdentifier:@"UserListViewController"];
    [self.userListViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
}

- (void)tearDown {
    self.userListViewController = nil;
    [super tearDown];
}

#pragma mark - View Loading Tests

- (void)testThatLoadsView {
    XCTAssertNotNil(self.userListViewController.view, @"View Not Loaded Successfully");
}

- (void)testParentViewHasTableViewSubview {
    
    NSArray *subviews = self.userListViewController.view.subviews;
    XCTAssertTrue([subviews containsObject:self.userListViewController.tableView], @"View Does Not Have Table View As Subview");
}

- (void)testThatTableViewLoads {
    XCTAssertNotNil(self.userListViewController.tableView, @"TableView Not Loaded");
}

#pragma mark - UITableView Tests

- (void)testThatViewConformsToUITableViewDataSource {
    XCTAssertTrue([self.userListViewController conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testThatTableViewHasDataSource {
    XCTAssertNotNil(self.userListViewController.tableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testThatViewConformsToUITableViewDelegate {
    XCTAssertTrue([self.userListViewController conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate {
    XCTAssertNotNil(self.userListViewController.tableView.delegate, @"Table delegate cannot be nil");
}

- (void)testPerformanceExample {
    
    [self measureBlock:^{
        [self.userListViewController loadUsers];
        
    }];
}



@end
