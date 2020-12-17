//
//  ViewController.m
//  ThinkNews
//
//  Created by 王晓丰 on 2020/12/2.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <TYCyclePagerView/TYCyclePagerView.h>
#import <TYCyclePagerView/TYPageControl.h>
#import <WMZDialog/WMZDialog.h>
#import "view/TYCyclePagerViewCell.h"
#import "ListViewController.h"
#import <Masonry/Masonry.h>
#import "pages/RecyclerViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView* m_scrollMain;

@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, strong) NSArray *datas;

@property (nonatomic, strong) UIButton* m_pbtnListView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"viewDidLoad");
//    [self initButton];
    
    [self initView];
}

#pragma mark - init

-(void) initView {
    
    [self initPagerView];
    [self initPageControl];
    [self initData];
    
    [self initButton];
}

-(void) initScrollView {
//    self.m_scrollMain = [[UIScrollView alloc] ]
}

-(void) initButton {
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    btn1.translatesAutoresizingMaskIntoConstraints = NO;
    [btn1 setTitle:@"NEXT" forState:UIControlStateNormal];
    [btn1 setTitle:@"NEXT" forState:UIControlStateHighlighted];
    [btn1 addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    
    
    NSLayoutConstraint *buttonXConstraint = [NSLayoutConstraint
        constraintWithItem:btn1
        attribute: NSLayoutAttributeLeft
        relatedBy: NSLayoutRelationEqual
        toItem: self.view
        attribute: NSLayoutAttributeLeft
        multiplier:1.0 constant:0.0f];

//    buttonXConstraint.priority = UILayoutPriorityDefaultHigh;
    NSLayoutConstraint *buttonYConstraint = [NSLayoutConstraint
        constraintWithItem: btn1
        attribute: NSLayoutAttributeTop
        relatedBy: NSLayoutRelationEqual
        toItem: self.pageControl
        attribute: NSLayoutAttributeBottom
        multiplier: 1.0f constant: 0.0f];
    
    [self.view addConstraints:@[buttonXConstraint, buttonYConstraint]];
    
    //list view button
    self.m_pbtnListView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    self.m_pbtnListView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.m_pbtnListView setTitle:@"LIST VIEW TEST" forState:UIControlStateNormal];
    [self.m_pbtnListView addTarget:self action:@selector(onListClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.m_pbtnListView];
    
    [self.m_pbtnListView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(btn1.mas_bottom);
        make.left.equalTo(btn1.mas_left);
    }];
}

- (void)initPagerView {
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]init];
    pagerView.layer.borderWidth = 0;
    pagerView.isInfiniteLoop = YES;
    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    // registerClass or registerNib
    [pagerView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:pagerView];
    self.pagerView = pagerView;
}

- (void)initPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]init];
    //pageControl.numberOfPages = self.datas.count;
    pageControl.currentPageIndicatorSize = CGSizeMake(8, 8);
    pageControl.pageIndicatorSize = CGSizeMake(6, 6);
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
//    pageControl.pageIndicatorImage = [UIImage imageNamed:@"Dot"];
//    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"DotSelected"];
//    pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
//    pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    [self.pagerView addSubview:pageControl];
    self.pageControl = pageControl;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.pagerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame) / 2);
    self.pageControl.frame = CGRectMake(0, CGRectGetHeight(self.pagerView.frame) - 26, CGRectGetWidth(self.pagerView.frame), 26);
}

- (void)initData {
    NSMutableArray *datas = [NSMutableArray array];
    for (int i = 0; i < 7; ++i) {
        if (i == 0) {
            [datas addObject:[UIColor redColor]];
            continue;
        }
        [datas addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0]];
    }
    self.datas = [datas copy];
    self.pageControl.numberOfPages = self.datas.count;
    [self.pagerView reloadData];
    //[self.pagerView scrollToItemAtIndex:3 animate:YES];
}


#pragma mark - TYCyclePagerViewDataSource
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return self.datas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
    cell.backgroundColor = self.datas[index];
    cell.label.text = [NSString stringWithFormat:@"index->%ld",index];
    
//    [cell.label targetForAction:@selector(onBannerClicked:) withSender:self];
//    [cell.label addTarget:self action:@selector(onBannerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
//    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame)*0.8, CGRectGetHeight(pageView.frame)*0.8);
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame), CGRectGetHeight(pageView.frame));
    layout.itemSpacing = 15;
    //layout.minimumAlpha = 0.3;
//    layout.itemHorizontalCenter = self.horCenterSwitch.isOn;
    return layout;
}

#pragma mark - events

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    self.pageControl.currentPage = toIndex;
    //[self.pageControl setCurrentPage:newIndex animate:YES];
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index {
    NSLog(@"Open banner ad at position: %ld", index);
}

-(void) onBtnClicked:(id)sender {
    NSLog(@"On button click");

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"I'm Title" message:@"I'm a Message" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action) {
        //button click event
        NSLog(@"Dialog OK button click");
        
        ListViewController* view = [[ListViewController alloc] init];
        UINavigationController *navi = (UINavigationController*) [UIApplication sharedApplication].keyWindow.rootViewController;
        [navi pushViewController:view animated:YES];

    }];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];

    [self presentViewController:alert animated:YES completion:nil];
}

-(void) onListClicked:(id)sender {
    NSLog(@"onListClicked");
        
    RecyclerViewController* view = [[RecyclerViewController alloc] init];
    UINavigationController *navi = (UINavigationController*) [UIApplication sharedApplication].keyWindow.rootViewController;
    [navi pushViewController:view animated:YES];
}

@end
