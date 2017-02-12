//
//  WebServiceManager.h
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "WebServiceConstants.h"

@interface WebServiceManager : AFHTTPSessionManager

+ (WebServiceManager *)sharedInstance;

- (void)getRequest:(NSString*)urlString
    controllerView:(UIView*)view
   completionBlock:(void(^)(id response,NSError * error))completionBlock;

@end

