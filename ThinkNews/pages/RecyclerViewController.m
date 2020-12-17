//
//  RecyclerViewController.m
//  ThinkNews
//
//  Created by 王晓丰 on 2020/12/17.
//

#import "RecyclerViewController.h"
#import <Masonry/Masonry.h>

@interface RecyclerViewController ()
@property (nonatomic, strong) UIButton* m_btnBack;
@end

@implementation RecyclerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}


#pragma mark - init

-(void) initView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initBackButton];
}

-(void) initBackButton {
    self.m_btnBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    self.m_btnBack.translatesAutoresizingMaskIntoConstraints = NO;
    [self.m_btnBack setTitle:@"BACK" forState:UIControlStateNormal];
    [self.m_btnBack addTarget:self action:@selector(onBackClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.m_btnBack];
    
    [self.m_btnBack mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
    }];
}

#pragma mark - events

- (void) onBackClicked:(id)sender; {
    UINavigationController *navi = (UINavigationController*) [UIApplication sharedApplication].keyWindow.rootViewController;
    [navi popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
