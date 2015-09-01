//
//  ViewController.m
//  UIPasteboardDemo
//  Copyright (c) 2015年 luobbe. All rights reserved.
//

#import "ViewController.h"
#import "LBCopyPasteLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet LBCopyPasteLabel *topLB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = @"123";
    //after 3s
    [self performSelector:@selector(checkPasteboard) withObject:nil afterDelay:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkPasteboard {
    //get general pasteboard
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if ([pasteboard.string isEqualToString:@"123"]) {
        [[[UIAlertView alloc] initWithTitle:@"Tips" message:[NSString stringWithFormat:@"剪切板的信息是%@，可以去领红包了",pasteboard.string] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    }
}

@end
