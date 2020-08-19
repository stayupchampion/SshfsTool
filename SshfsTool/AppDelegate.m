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

// 执行shell字符串
- (void)execute_shell_task:(NSString *)shell_str {
    // 创建shell任务
    NSTask *shellTask = [[NSTask alloc]init];
    [shellTask setLaunchPath:@"/bin/bash"];
    
    // -c 表示将后面的内容当成shellcode来执行
    [shellTask setArguments:[NSArray arrayWithObjects:@"-c", shell_str, nil]];
    
    //    NSPipe *pipe = [[NSPipe alloc]init];
    //    [shellTask setStandardOutput:pipe];
    
    // 执行shell任务
    [shellTask launch];
    // 阻塞进程
    //    [shellTask waitUntilExit];
    
    //    NSFileHandle *file = [pipe fileHandleForReading];
    //    NSData *data = [file readDataToEndOfFile];
    //    NSString *strReturnFromShell = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //    NSLog(@"The return content:\n%@",strReturnFromShell);
}

// 连接
- (IBAction)item1:(id)sender {
    // 读取ssh登录信息
    NSDictionary *login_dict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"user0"];
    // 拼接登陆shell命令
    NSString *shell_str = [NSString stringWithFormat:@"/usr/local/bin/sshfs %@@%@:%@ %@ -C -o reconnect", login_dict[@"UserName"], login_dict[@"Host"], login_dict[@"RemotePath"], login_dict[@"LocalPath"]];
    // 执行shell任务: sshfs connect
    [self execute_shell_task:shell_str];
}

// 断开
- (IBAction)disconnect:(id)sender {
    // 读取登录信息
    NSDictionary *login_dict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"user0"];
    // 拼接卸载命令
    NSString *shell_str = [NSString stringWithFormat:@"diskutil unmount %@", login_dict[@"LocalPath"]];
    // shell: sshfs disconnect
    [self execute_shell_task:shell_str];
}

- (IBAction)quit:(id)sender {
    [[NSApplication sharedApplication] terminate:self];
}

@end
