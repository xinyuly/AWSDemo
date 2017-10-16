//
//  KIAWSManager.h
//  AWSDemo
//
//  Created by 新雨 on 2017/9/26.
//  Copyright © 2017年 xinyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AWSCore/AWSCore.h>
#import <AWSS3/AWSS3.h>

#define  S3BucketName @"******" //your BucketName
#define  AWSURL  @"https://s3.amazonaws.com/******"

#define KICreateShowOrderImageKey(USER_ID)         [NSString stringWithFormat:@"images/showOrder/%@/%d.png", USER_ID, (int)[[NSDate date] timeIntervalSince1970]]

/**
 *    上传完成后的回调函数
 *
 *    @param uploadRequest 上下文信息，包括状态码，错误值
 *    @param key  URL
 */
typedef void (^AWSSuccessHandler)(AWSS3TransferManagerUploadRequest *uploadRequest, NSString *key);
typedef void (^AWSFailureHandler)(NSError *error);

@interface KIAWSManager : NSObject

- (void)uploadImage:(UIImage *)image key:(NSString *)key successHandler:(AWSSuccessHandler)success  failureHandler:(AWSFailureHandler)failure;

@end
