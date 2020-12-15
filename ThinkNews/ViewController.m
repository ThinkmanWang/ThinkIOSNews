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
}

#pragma mark - init

//-(void) initBanner {
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
//}

@end
