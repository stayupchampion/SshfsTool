//
//  main.m
//  SshfsTool
//
//  Created by Wanx on 2020/8/18.
//  Copyright © 2020 wanx. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    
    // 设置代理为AppDelegate
    NSApplication *app = [NSApplication sharedApplication];
    id delegate = [[AppDelegate alloc] init];
    app.delegate = delegate;
    
    return NSApplicationMain(argc, argv);
}
