//
//  UserModelTest.m
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserModel.h"

@interface UserModelTest : XCTestCase

@property (nonatomic, strong) UserModel *userModel;

@end

@implementation UserModelTest

- (void)setUp {
    [super setUp];
    
    NSDictionary * userInfo = @{@"id": @"25",
                                @"name": @"John Allen",
                                @"username": @"johnny27",
                                @"email":@"abc@xyz.com",
                                @"address": @{@"street":@"Kendell Road",
                                              @"suite":@"Apt 9674",
                                              @"city":@"Newyork",
                                              @"zipcode":@"4512612",
                                              @"geo":@{@"lat":@"45.265", @"lng":@"-52.542"}},
                                @"phone": @"9266656645",
                                @"website": @"yahoo.com",
                                @"company": @{@"name":@"Dundler Mufflin Company",
                                              @"catchPhrase":@"Multi-layered Architectural Company",
                                              @"bs":@"supply chain"}};
    
    _userModel = [[UserModel alloc]initWithUserInfo:userInfo];
    
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)testUserModel {
    
    XCTAssertNotNil(_userModel, @"User Model Not Created Successfully");
}

- (void)testUserFirstName {
    
    XCTAssertNotNil(_userModel.name, @"User First Name Is Nil");
}

- (void)testUserName {
    
    XCTAssertNotNil(_userModel.userName, @"User Name Is Nil");
}

- (void)testUserEmail {
    
    XCTAssertNotNil(_userModel.emailAddress, @"User Email Is Nil");
}

- (void)testUserAddressDictionary {
    
    XCTAssertNotNil(_userModel.userInfoDic[@"address"], @"User Address Dictionary Is Nil");
}

- (void)testUserAddressSuite {
    
    NSDictionary * addressDic = _userModel.userInfoDic[@"address"];
    
    XCTAssertNotNil(addressDic[@"suite"], @"User Address Suite Is Nil");
}

- (void)testUserAddressStreet {
    
    NSDictionary * addressDic = _userModel.userInfoDic[@"address"];
    
    XCTAssertNotNil(addressDic[@"street"], @"User Address Street Is Nil");
}

- (void)testUserAddressCity {
    
    NSDictionary * addressDic = _userModel.userInfoDic[@"address"];
    
    XCTAssertNotNil(addressDic[@"city"], @"User Address City Is Nil");
}

- (void)testUserAddressZipCode {
    
    NSDictionary * addressDic = _userModel.userInfoDic[@"address"];
    
    XCTAssertNotNil(addressDic[@"zipcode"], @"User Address ZipCode Is Nil");
}

- (void)testUserAddress {
    
    XCTAssertNotNil(_userModel.address, @"User Address Not Created");
}

- (void)testPerformanceExample {
    
    [self measureBlock:^{
        
    }];
}
@end
