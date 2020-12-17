//
//  ListViewController.m
//  ThinkNews
//
//  Created by 王晓丰 on 2020/12/16.
//

#import "ListViewController.h"
#import <AFNetworking/AFNetworking.h>
#include <Masonry/Masonry.h>

@interface ListViewController ()
@property (nonatomic, strong) UILabel* m_labelHello;
@property (nonatomic, strong) UIButton* m_btnBack;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
    [self initBackButton];
}

#pragma mark - init

- (void) initView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initLabel];
}

- (void) initLabel {
    self.m_labelHello = [[UILabel alloc] init];
    self.m_labelHello.text = @"FXXXXK";
    
    self.m_labelHello.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.m_labelHello];
    
    [self.m_labelHello mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
    }];
}

-(void) initBackButton {
    self.m_btnBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    self.m_btnBack.translatesAutoresizingMaskIntoConstraints = NO;
    [self.m_btnBack setTitle:@"BACK" forState:UIControlStateNormal];
    [self.m_btnBack addTarget:self action:@selector(onBackClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.m_btnBack];
    
    [self.m_btnBack mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.m_labelHello.mas_bottom);
        make.left.equalTo(self.m_labelHello.mas_left);
    }];
}

#pragma mark - events

- (void) onBackClicked:(id)sender; {
    UINavigationController *navi = (UINavigationController*) [UIApplication sharedApplication].keyWindow.rootViewController;
    [navi popViewControllerAnimated:YES];
}

@end
