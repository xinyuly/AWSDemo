//
//  ViewController.m
//  AWSDemo
//
//  Created by 新雨 on 2017/9/26.
//  Copyright © 2017年 xinyu. All rights reserved.
//

#import "ViewController.h"
#import "KIAWSManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[KIAWSManager alloc] init] uploadImage:[UIImage imageNamed:@"test.png"] key:KICreateShowOrderImageKey(@"9823465") successHandler:^(AWSS3TransferManagerUploadRequest *uploadRequest, NSString *key) {
        
    } failureHandler:^(NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
