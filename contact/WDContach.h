
//
//  WDContach.h
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#ifndef WDContach_h
#define WDContach_h
typedef enum : NSUInteger {
    WDAuthorizeStatusNotDetermined,
    WDAuthorizeStatusRestricted,
    WDAuthorizeStatusDenied,
    WDAuthorizeStatusAuthorized
} WDAuthorizeStatus;

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)



typedef void(^requestAuthorizeBlock)(NSError * error,BOOL granted);
typedef void(^getContactsBlock)(NSArray * contacts);

#endif /* KDContach_h */
