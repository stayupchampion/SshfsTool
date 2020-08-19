//
//  AppDelegate.m
//  SshfsTool
//
//  Created by Wanx on 2020/8/18.
//  Copyright © 2020 wanx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

// 菜单空间和状态栏按钮
@property (weak) IBOutlet NSMenu *menu;
@property (nonatomic, strong) NSStatusItem *status_item;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // 创建状态栏按钮，并自定义图片
    self.status_item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    NSImage *image = [NSImage imageNamed:@"LogoStatus"];
    image.size = NSMakeSize(18, 18);
    [self.status_item.button setImage:image];
    self.status_item.menu = self.menu;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)quit:(id)sender {
    [[NSApplication sharedApplication] terminate:self];
}

@end
