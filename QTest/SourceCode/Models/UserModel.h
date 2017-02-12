//
//  UserModel.h
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(nonatomic,strong) NSNumber * userID;
@property(nonatomic,strong) NSString * name;
@property(nonatomic,strong) NSString * userName;
@property(nonatomic,strong) NSString * emailAddress;
@property(nonatomic,strong) NSString * address;

@property(nonatomic,strong) NSDictionary * userInfoDic;

-(id)initWithUserInfo:(NSDictionary*)userInfo;

@end
