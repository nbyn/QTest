//
//  WebServiceManager.m
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import "WebServiceManager.h"

#import "UIView+Toast.h"
#import "MBProgressHUD.h"

@implementation WebServiceManager

static NSString * const kInternetErrorMessage = @"Internet Not Working...";

+ (WebServiceManager *)sharedInstance {
    static WebServiceManager *_serviceClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClient = [[WebServiceManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        [[AFNetworkReachabilityManager sharedManager]startMonitoring];
        
    });
    return _serviceClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (!(status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi)) {
            
            UIWindow* window=[[[UIApplication sharedApplication]delegate]window];
            [window.rootViewController.view makeToast:kInternetErrorMessage];
        }
    }];
    return self;
}

- (void)getRequest:(NSString*)urlString
    controllerView:(UIView*)view
   completionBlock:(void(^)(id response,NSError * error))completionBlock {
    
    [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    [self GET:urlString parameters:nil progress:nil
      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          
          [MBProgressHUD hideHUDForView:view animated:YES];
          completionBlock(responseObject,nil);
          
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          
          [MBProgressHUD hideHUDForView:view animated:YES];
          completionBlock(nil,error);
      }];
}

@end
