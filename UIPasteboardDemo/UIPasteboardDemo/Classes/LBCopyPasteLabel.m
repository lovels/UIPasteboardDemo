//
//  LBCopyPasteLabel.m
//  UIPasteboardDemo
//  Copyright (c) 2015年 luobbe. All rights reserved.
//

#import "LBCopyPasteLabel.h"

@implementation LBCopyPasteLabel

- (BOOL)canBecomeFirstResponder {
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(cut:)) {
        return NO;
    } else if (action == @selector(copy:)) {
        return YES;
    } else if (action == @selector(paste:)) {
        return YES;
    } else if (action == @selector(select:)) {
        return NO;
    } else if (action == @selector(selectAll:)) {
        return NO;
    } else {
        return [super canPerformAction:action withSender:sender];
    }
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    [self becomeFirstResponder];
    [self performSelector:@selector(showMenu:)
               withObject:self afterDelay:1.0f];
    [super touchesBegan:touches withEvent:event];
}

- (void)showMenu:(id)view {
    //get UIMenuController
    UIMenuController * menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:CGRectZero inView: view];
    [menu setMenuVisible: YES animated: YES];
}

- (void)copy:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.text;
}

- (void)paste:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    self.text = pasteboard.string;
}


@end
