//
//  ViewController.m
//  ThinkNews
//
//  Created by 王晓丰 on 2020/12/2.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <TYCyclePagerView/TYCyclePagerView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"viewDidLoad");
    [self initButton];
}

#pragma mark - init

-(void) onBtnClicked:(id)sender {
    NSLog(@"On button click");
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"I'm Title" message:@"I'm a Message" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action) {
        //button click event
        NSLog(@"Dialog OK button click");
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) initButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    btn.frame = CGRectMake(0, 100, 90, 35);
    [btn setTitle:@"ZoomIn" forState:UIControlStateNormal];
    [btn setTitle:@"ZoomIn" forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

-(void) initBanner {
//    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]init];
//    pagerView.layer.borderWidth = 1;
//    pagerView.isInfiniteLoop = YES;
//    pagerView.autoScrollInterval = 3.0;
//    pagerView.dataSource = self;
//    pagerView.delegate = self;
//    // registerClass or registerNib
//    [pagerView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"cellId"];
//    [self.view addSubview:pagerView];
//    m_pBanner = pagerView;
}

@end
