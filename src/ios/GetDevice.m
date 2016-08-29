//
//  GetDevice.m
//
//  Created by ChenTivon on 14/11/15.
//

#import "GetDevice.h"
#import "KeyChainStore.h"
#import <Foundation/NSUUID.h>

@implementation GetDevice

- (void) get: (CDVInvokedUrlCommand*)command {
    [self.commandDelegate runInBackground:^{

        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *uuidUserDefaults = [defaults objectForKey:@"uuid"];

        NSString *uuid = (NSString *)[KeyChainStore load:@"uuid"];

        if ( uuid && !uuidUserDefaults) {
            [defaults setObject:uuid forKey:@"uuid"];
            [defaults synchronize];

        }  else if ( !uuid && !uuidUserDefaults ) {
            NSString *uuidString = [self randomUUID];

            [KeyChainStore save:@"uuid" data:uuidString];

            [defaults setObject:uuidString forKey:@"uuid"];
            [defaults synchronize];

            uuid = (NSString *)[KeyChainStore load:@"uuid"];

        } else if ( ![uuid isEqualToString:uuidUserDefaults] ) {
            [KeyChainStore save:@"uuid" data:uuidUserDefaults];
            uuid = (NSString *)[KeyChainStore load:@"uuid"];
        }

        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:uuid];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (NSString *)randomUUID {
    if (NSClassFromString(@"NSUUID")) { // only available in iOS >= 6.0
        return [[NSUUID UUID] UUIDString];
    }
    
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    return (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault, uuidRef));
}

@end
