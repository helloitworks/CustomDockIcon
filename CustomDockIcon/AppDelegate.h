//
//  AppDelegate.h
//  CustomDockIcon
//
//  Created by Shen Yixin on 14-2-17.
//  Copyright (c) 2014年 http://www.helloitworks.com/. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DockIconBadgeView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    DockIconBadgeView *_dockView;

}

@property (assign) IBOutlet NSWindow *window;

@end
