//
//  GetDevice.h
//
//  Created by ChenTivon on 14/11/15.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

@class KeychainItemWrapper;

@interface GetDevice : CDVPlugin

- (void)get: (CDVInvokedUrlCommand*)command;

@end
