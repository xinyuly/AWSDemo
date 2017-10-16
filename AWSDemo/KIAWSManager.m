//
//  KIAWSManager.m
//  AWSDemo
//
//  Created by 新雨 on 2017/9/26.
//  Copyright © 2017年 xinyu. All rights reserved.
//

#import "KIAWSManager.h"

@interface KIAWSManager ()
@property (nonatomic, copy) AWSSuccessHandler success;
@property (nonatomic, copy) AWSFailureHandler failure;
@end

@implementation KIAWSManager

- (void)uploadImage:(UIImage *)image key:(NSString *)key successHandler:(AWSSuccessHandler)success  failureHandler:(AWSFailureHandler)failure {
    NSString *fileName = [[[NSProcessInfo processInfo] globallyUniqueString] stringByAppendingString:@".png"];
    NSString *filePath = [[NSTemporaryDirectory() stringByAppendingPathComponent:@"upload"] stringByAppendingPathComponent:fileName];
    NSData * imageData = UIImagePNGRepresentation(image);
    
    [imageData writeToFile:filePath atomically:YES];
    
    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.body = [NSURL fileURLWithPath:filePath];
    uploadRequest.key = fileName;
    uploadRequest.bucket = S3BucketName;
    self.success = success;
    self.failure = failure;
    [self upload:uploadRequest];
}

- (void)upload:(AWSS3TransferManagerUploadRequest *)uploadRequest {
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    
    __weak KIAWSManager *weakSelf = self;
    [[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            if (weakSelf.failure) {
                weakSelf.failure(task.error);
            }
        }
        
        if (task.result) {
            //进行中
          } else {
            //完成
              if (weakSelf.success) {
                  weakSelf.success(uploadRequest, uploadRequest.key);
              }
        }

        return nil;
    }];
}


@end
