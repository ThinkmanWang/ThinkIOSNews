//
//  ListViewController.m
//  ThinkNews
//
//  Created by 王晓丰 on 2020/12/16.
//

#import "ListViewController.h"

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
//    self.m_labelHello.backgroundColor = [UIColor redColor];
//    self.m_labelHello.textColor = [UIColor greenColor];
    
    self.m_labelHello.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.m_labelHello];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint
        constraintWithItem:self.m_labelHello
        attribute: NSLayoutAttributeLeft
        relatedBy: NSLayoutRelationEqual
        toItem: self.view
        attribute: NSLayoutAttributeLeft
        multiplier:1.0 constant:0.0f];

//    xConstraint.priority = UILayoutPriorityDefaultHigh;
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint
        constraintWithItem: self.m_labelHello
        attribute: NSLayoutAttributeTop
        relatedBy: NSLayoutRelationEqual
        toItem: self.view
        attribute: NSLayoutAttributeTop
        multiplier: 1.0f constant: 0.0f];
    
    [self.view addConstraints:@[xConstraint, yConstraint]];
}

-(void) initBackButton {
    self.m_btnBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    self.m_btnBack.translatesAutoresizingMaskIntoConstraints = NO;
    [self.m_btnBack setTitle:@"BACK" forState:UIControlStateNormal];
//    [self.m_btnBack setTitle:@"ZoomIn" forState:UIControlStateHighlighted];
    [self.m_btnBack addTarget:self action:@selector(onBackClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.m_btnBack];
    
    
    NSLayoutConstraint *buttonXConstraint = [NSLayoutConstraint
        constraintWithItem:self.m_btnBack
        attribute: NSLayoutAttributeLeft
        relatedBy: NSLayoutRelationEqual
        toItem: self.m_labelHello
        attribute: NSLayoutAttributeLeft
        multiplier:1.0 constant:0.0f];

//    buttonXConstraint.priority = UILayoutPriorityDefaultHigh;
    NSLayoutConstraint *buttonYConstraint = [NSLayoutConstraint
        constraintWithItem: self.m_btnBack
        attribute: NSLayoutAttributeTop
        relatedBy: NSLayoutRelationEqual
        toItem: self.m_labelHello
        attribute: NSLayoutAttributeBottom
        multiplier: 1.0f constant: 0.0f];
    
    [self.view addConstraints:@[buttonXConstraint, buttonYConstraint]];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - events

- (void) onBackClicked:(id)sender; {
    UINavigationController *navi = (UINavigationController*) [UIApplication sharedApplication].keyWindow.rootViewController;
    [navi popViewControllerAnimated:YES];
}

@end
