//
//  AppDelegate.m
//  CustomDockIcon
//
//  Created by Shen Yixin on 14-2-17.
//  Copyright (c) 2014年 http://www.helloitworks.com/. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _dockView = [[DockIconBadgeView alloc] init];
    //icon image设置一次就行
    _dockView.iconImage = [NSImage imageNamed:@"Thunder"];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateDockIcon) userInfo:nil repeats:YES];

}


- (void)updateDockIcon
{
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *text = [formatter stringFromDate:[NSDate date]];
    
    _dockView.text = text;
    [[NSApp dockTile] setContentView: _dockView];
    [[NSApp dockTile] setBadgeLabel:[NSString stringWithFormat:@"%ld", random() % 101]];
    [[NSApp dockTile] display];
}
@end
