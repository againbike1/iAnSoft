//
//  ViewController.m
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "IanSoft.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestModel *model = [[TestModel alloc] init];
    model.name = @"Thomas";
    BOOL success = [IANStoreUtility storeToRootDirectory:model key:@"testKey"];
    if (success) {
        IANLog(@"success");
        
        IANBaseModel *getModel = [IANStoreUtility fetchInRootDirectoryByKey:@"testKey"];
        IANLog(@"name:%@", getModel.name);
    }else {
        IANLog(@"failure");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
