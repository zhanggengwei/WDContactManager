
//
//  KDAddressBook.m
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDAddressBook.h"
#import <AddressBook/AddressBook.h>
#import "WDContactModel.h"
#import "WDContach.h"

@implementation WDAddressBook
{
    ABAddressBookRef _bookRef;
}
+ (instancetype)defaultManager
{
    static WDAddressBook * addressBook;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        addressBook  = [WDAddressBook new];
    });
    return addressBook;
}

- (instancetype)init
{
    if(self = [super init])
    {
        _bookRef = ABAddressBookCreate();
    }
    return self;
}

- (void)dealloc
{
    if(_bookRef)
    {
        CFRelease(_bookRef);
        _bookRef = NULL;
    }
}
- (void)loadAllContacts:(getContactsBlock)block
{
    CFArrayRef arr = ABAddressBookCopyArrayOfAllPeople(_bookRef);
    NSInteger count = ABAddressBookGetPersonCount(_bookRef);
    NSMutableArray * contactList = [NSMutableArray new];
    for (int i = 0; i <count; i++) {
        ABRecordRef recoard = CFArrayGetValueAtIndex(arr,i);
        Class<WDContactProtrocal> cls = self.cls?self.cls:[WDContactModel class];
        id<WDContactProtrocal> model = [[cls.class alloc]initWithObj:(void *)recoard];
        [contactList addObject:model];
    }
    CFRelease(arr);
    if(block)
    {
        block(contactList);
    }
}
- (void)loadSortAllContacts:(getContactsBlock)block
{
    [self loadAllContacts:^(NSArray *contacts) {
        NSArray * arr =[contacts sortedArrayUsingSelector:@selector(compare:)];
        if(block)
        {
            block(arr);
        }
    }];
}
- (void)requestAuthorizeWithFunction:(requestAuthorizeBlock)block
{
    ABAddressBookRequestAccessWithCompletion(_bookRef, ^(bool granted, CFErrorRef error) {
        if(block)
        {
            block(CFBridgingRelease(error),granted);
        }
    });
}
@end
