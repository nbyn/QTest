//
//  UserModel.m
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(id)initWithUserInfo:(NSDictionary*)userInfo {
    if (self = [super init]) {
        
        self.userInfoDic = userInfo;
        
        self.userID = [userInfo objectForKey:@"id"] != nil ? userInfo[@"id"] : @"";
        self.name = [userInfo objectForKey:@"name"] != nil ? userInfo[@"name"] : @"";
        self.userName = [userInfo objectForKey:@"username"] != nil ? userInfo[@"username"] : @"";
        self.emailAddress = [userInfo objectForKey:@"email"] != nil ? userInfo[@"email"] : @"";
        
        if ([userInfo objectForKey:@"address"] != nil) {
        
            NSDictionary * addressDictionary = userInfo[@"address"];
        
            NSString * suite = [addressDictionary objectForKey:@"suite"] != nil ?
                                addressDictionary[@"suite"] : @"";
            NSString * street = [addressDictionary objectForKey:@"street"] != nil ?
                                addressDictionary[@"street"] : @"";
            NSString * city = [addressDictionary objectForKey:@"city"] != nil ?
                                addressDictionary[@"city"] : @"";
            NSString * zipCode = [addressDictionary objectForKey:@"zipcode"] != nil ?
                                addressDictionary[@"zipcode"] : @"";

            self.address = [NSString stringWithFormat:@"%@ %@, %@, %@",suite,street,city,zipCode];
        }
        else {
            self.address = @"";
        }
    }
    return self;
}

@end
