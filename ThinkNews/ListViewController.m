//
//  ListViewController.m
//  ThinkNews
//
//  Created by 王晓丰 on 2020/12/16.
//

#import "ListViewController.h"

@interface ListViewController ()
@property (nonatomic, strong) UILabel* m_labelHello;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (void) initView {
    [self initLabel];
}

- (void) initLabel {
    self.m_labelHello = [[UILabel alloc] init];
    self.m_labelHello.text = @"FXXXXK";
    self.m_labelHello.backgroundColor = [UIColor redColor];
    self.m_labelHello.textColor = [UIColor greenColor];
    
    self.m_labelHello.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.m_labelHello];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint
        constraintWithItem:self.m_labelHello
        attribute: NSLayoutAttributeLeft
        relatedBy: NSLayoutRelationEqual
        toItem: self.view
        attribute: NSLayoutAttributeLeft
        multiplier:1.0 constant:0.0f];

    xConstraint.priority = UILayoutPriorityDefaultHigh;
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint
        constraintWithItem: self.m_labelHello
        attribute: NSLayoutAttributeTop
        relatedBy: NSLayoutRelationEqual
        toItem: self.view
        attribute: NSLayoutAttributeTop
        multiplier: 1.0f constant: 0.0f];
    
    [self.view addConstraints:@[xConstraint, yConstraint]];
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
