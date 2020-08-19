//
//  WXSetVC.m
//  SshfsTool
//
//  Created by Wanx on 2020/8/19.
//  Copyright © 2020 wanx. All rights reserved.
//

#import "WXSetVC.h"

@interface WXSetVC ()

@property (weak) IBOutlet NSTextField *name_text;
@property (weak) IBOutlet NSTextField *host_text;
@property (weak) IBOutlet NSTextField *remote_path_text;
@property (weak) IBOutlet NSTextField *local_path_text;

@end

@implementation WXSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"偏好设置";
    
    // 文本框注释
    self.name_text.placeholderString = @"主机用户名";
    self.host_text.placeholderString = @"主机IP/域名/在本机的别名";
    self.remote_path_text.placeholderString = @"共享的主机目录";
    self.local_path_text.placeholderString = @"一个本地空目录，用于挂载远程目录";
    
    // 加载已有的登录信息
    NSDictionary *login_dict = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"user0"];
    if (login_dict) {
        self.name_text.stringValue = login_dict[@"UserName"];
        self.host_text.stringValue = login_dict[@"Host"];
        self.remote_path_text.stringValue = login_dict[@"RemotePath"];
        self.local_path_text.stringValue = login_dict[@"LocalPath"];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewController:self];
}

- (IBAction)save:(id)sender {
    // 检查是否有空缺
    if (!self.name_text.stringValue.length || !self.host_text.stringValue.length || !self.remote_path_text.stringValue.length || !self.local_path_text.stringValue.length) {
        NSAlert *alert = [[NSAlert alloc] init];
        alert.messageText = @"不可留空";
        [alert addButtonWithTitle:@"确定"];
        [alert runModal];
        return ;
    }
    
    // 保存ssh登录信息(覆盖)
    NSDictionary *login_dict = @{
                                 @"UserName": self.name_text.stringValue,
                                 @"Host": self.host_text.stringValue,
                                 @"RemotePath": self.remote_path_text.stringValue,
                                 @"LocalPath": self.local_path_text.stringValue,
                                 };
    [[NSUserDefaults standardUserDefaults] setObject:login_dict forKey:@"user0"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewController:self];
}

@end
