//
//  GetDevice.m
//
//  Created by ChenTivon on 14/11/15.
//

#import "GetDevice.h"
#import "KeyChainStore.h"
#import <Foundation/NSUUID.h>

#define KEY_USERNAME @"com.novonity.mayi"

@implementation GetDevice

- (void) getuuid: (CDVInvokedUrlCommand*)command {
    NSString *uuid = [self getUUIDString];
    
    NSLog(@"GetDevice getuuid is: %@", uuid);

    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:1];
    [dic setObject:uuid forKey:@"uuid"];

    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsDictionary: dic];
    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
}

- (NSString *)getUUIDString {
    NSString * strUUID = (NSString *)[KeyChainStore load:KEY_USERNAME];

    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID) {
        strUUID = [self randomUUID];

        //将该uuid保存到keychain
        [KeyChainStore save:KEY_USERNAME data:strUUID];

    }
    return strUUID;
}

- (NSString *)randomUUID {
    if (NSClassFromString(@"NSUUID")) { // only available in iOS >= 6.0
        return [[NSUUID UUID] UUIDString];
    }
    
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    return (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault, uuidRef));
}

@end
