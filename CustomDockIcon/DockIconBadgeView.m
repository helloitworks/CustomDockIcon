//  DockIconBadgeView.m
//  Created by Shen Yixin


#import "DockIconBadgeView.h"

@implementation DockIconBadgeView
@synthesize iconImage = _iconImage;
@synthesize text = _text;

//icon
static const NSRect kIconBounds ={ 0.f, 0.f, 128.f, 128.f };

//background
static const NSRect kSpeedBackgroundBounds = { 0.f, 0.f, 128.f, 32.f };
static const CGFloat kSpeedBackgroundXRadius = 16.f;
static const CGFloat kSpeedBackgroundYRadius = 16.f;
static const CGFloat kSpeedBackgroundColor[] = { 28.f / 255.f, 164.f / 255.f, 242.f / 255.f, 1.0f };

//font
static const NSRect kSpeedFontBounds = { 0.f, 2.f, 128.f, 28.f };
static const CGFloat kSpeedFontColor[] = { 255.f / 255.f, 255.f / 255.f, 255.f / 255.f, 1.0f };
static const CGFloat kSpeedFontName = 22.f;
static const CGFloat kSpeedFontSize = 22.f;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _iconImage = [NSImage imageNamed:@"Thunder"];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Draw Dock Icon
    [_iconImage drawInRect: kIconBounds fromRect: NSMakeRect(0, 0, [_iconImage size].width, [_iconImage size].height) operation: NSCompositeSourceOver fraction: 1.0];
    
    if ([_text isEqualToString:@""] || _text == nil)
    {
        return;
    }
    // Drawing Speed Background
    NSColor* speedBackgroundColor = nil;
    speedBackgroundColor = [NSColor colorWithColorSpace: [NSColorSpace sRGBColorSpace] components: kSpeedBackgroundColor count: sizeof(kSpeedBackgroundColor) / sizeof(CGFloat)];;
    [speedBackgroundColor setFill];
    
    NSBezierPath* path = nil;
    path = [NSBezierPath bezierPathWithRoundedRect: kSpeedBackgroundBounds xRadius: kSpeedBackgroundXRadius yRadius: kSpeedBackgroundYRadius];
    [path fill];
    
    // Draw Speed Desc
    NSMutableAttributedString *speed = [[[NSMutableAttributedString alloc] initWithString: _text] autorelease];
    NSRange range = NSMakeRange(0, [speed length]);
    
    NSFont *font = [NSFont fontWithName:@"Lucida Grande" size:kSpeedFontSize];
    [speed addAttribute: NSFontAttributeName value: font range: range];
    
    NSColor *fontColor = [NSColor colorWithColorSpace: [NSColorSpace sRGBColorSpace] components: kSpeedFontColor count: sizeof(kSpeedFontColor) / sizeof(CGFloat)];
    [speed addAttribute: NSForegroundColorAttributeName value: fontColor range: range];
    
    NSMutableParagraphStyle* style = [[[NSMutableParagraphStyle alloc] init] autorelease];
    [style setAlignment: NSCenterTextAlignment];
    [speed addAttribute: NSParagraphStyleAttributeName value: style range: range];
    
    [speed drawInRect: kSpeedFontBounds];
    
}

@end
