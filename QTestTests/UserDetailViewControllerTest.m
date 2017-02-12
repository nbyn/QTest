//
//  UserDetailViewControllerTest.m
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserDetailViewController.h"
#import "UserDetailCell.h"

@interface UserDetailViewControllerTest : XCTestCase

@property (nonatomic, strong) UserDetailViewController *userDetailViewController;

@end

@implementation UserDetailViewControllerTest

- (void)setUp {
    [super setUp];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.userDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"UserDetailViewController"];
    [self.userDetailViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
}

- (void)tearDown {
    self.userDetailViewController = nil;
    [super tearDown];
}

#pragma mark - View Loading Tests

- (void)testThatLoadsView {
    XCTAssertNotNil(self.userDetailViewController.view, @"View Not Loaded Successfully");
}

- (void)testParentViewHasTableViewSubview {
    
    NSArray *subviews = self.userDetailViewController.view.subviews;
    XCTAssertTrue([subviews containsObject:self.userDetailViewController.tableView], @"View Does Not Have Table View As Subview");
}

- (void)testThatTableViewLoads {
    XCTAssertNotNil(self.userDetailViewController.tableView, @"TableView Not Loaded");
}

#pragma mark - UITableView Tests

- (void)testThatViewConformsToUITableViewDataSource {
    XCTAssertTrue([self.userDetailViewController conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testThatTableViewHasDataSource {
    XCTAssertNotNil(self.userDetailViewController.tableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testThatViewConformsToUITableViewDelegate {
    XCTAssertTrue([self.userDetailViewController conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate {
    XCTAssertNotNil(self.userDetailViewController.tableView.delegate, @"Table delegate cannot be nil");
}

- (void)testPerformanceExample {
    
    [self measureBlock:^{
        [self.userDetailViewController loadUserPosts];
        
    }];
}
@end
