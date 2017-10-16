# AWSDemo
AWS SDK S3TransferManager

1.使用方式

```
[[[KIAWSManager alloc] init] uploadImage:[UIImage 
imageNamed:@"test.png"] key:KICreateShowOrderImageKey(@"9823465") 
successHandler:^(AWSS3TransferManagerUploadRequest *uploadRequest, 
NSString *key) {
        
    } failureHandler:^(NSError *error) {
        
    }];
```