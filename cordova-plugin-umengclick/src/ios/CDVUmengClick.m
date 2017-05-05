
//友盟统计
#import "UMMobClick/MobClick.h"
#import <Cordova/CDV.h>
#import "CDVUmengClick.h"
#import "CountDown.h"

@implementation CDVUmengClick

-(void)clickEvent:(CDVInvokedUrlCommand*)command
{
    NSDictionary *arg = [command.arguments objectAtIndex:0];
    [MobClick event:[arg objectForKey:@"eventId"] label:[arg objectForKey:@"eventName"]];
    NSLog(@"MobClick%@,%@",[arg objectForKey:@"eventId"],[arg objectForKey:@"eventName"]);
    
    //测试回调的代码
    /*[self callback:command];
    CountDown *countDown = [[CountDown alloc] init];
    [countDown countDownWithStratDate:[NSDate date] finishDate:[NSDate dateWithTimeIntervalSinceNow:5] completeBlock:^(NSInteger day, NSInteger hour, NSInteger minute, NSInteger second) {
        NSLog(@"second = %li",second);
        NSInteger totoalSecond =day*24*60*60+hour*60*60 + minute*60+second;
        if (totoalSecond==0) {
             [countDown destoryTimer];
            [self callback:command];
        }
    }];*/
}


-(void) callback:(CDVInvokedUrlCommand*)command{
    
    NSDictionary* info = @{
                           @"eventId": @"oc eventId",
                           @"eventName": @"oc eventName"
                           };;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

@end
