//
//  ViewController.m
//  WDContactManager
//
//  Created by VD on 2017/12/2.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "ViewController.h"
#import "WDContactManager.h"

@interface ViewController ()
@property (nonatomic,strong) WDContactManager * contactManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contactManager = [WDContactManager defaultManger];
    __weak __typeof(WDContactManager *) weakSelf = self.contactManager;
//    if(self.contactManager.addRessBook.status==WDAuthorizeStatusAuthorized)
//    {
//        [weakSelf.addRessBook loadAllContacts:^(NSArray *contacts) {
//            NSLog(@"contacts ==%@",contacts);
//        }];
//    }
    [self.contactManager.addRessBook requestAuthorizeWithFunction:^(NSError *error, BOOL granted) {
        if(granted)
        {
            [weakSelf.addRessBook loadAllContacts:^(NSArray *contacts) {
                NSLog(@"contacts ==%@",contacts);
            }];
        }
    }];
    
    [[WDContactManager defaultManger].addRessBook loadAllContacts:^(NSArray *contacts) {
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
