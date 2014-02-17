//
//  DockIconBadgeView.h
//
//  Created by Shen Yixin

#import <Cocoa/Cocoa.h>

@interface DockIconBadgeView : NSView
{
    NSImage *_iconImage;
    NSString *_text;
}

@property (copy) NSString *text;

@end
