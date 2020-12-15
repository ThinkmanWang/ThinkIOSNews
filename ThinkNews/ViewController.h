//
//  ViewController.h
//  ThinkNews
//
//  Created by 王晓丰 on 2020/12/2.
//

#import <UIKit/UIKit.h>
#import <TYCyclePagerView/TYCyclePagerView.h>

@interface ViewController : UIViewController {
    TYCyclePagerView* m_pBanner;
}

-(void) initBanner;
-(void) zoomInAction:(id)sender;
-(void) initButton;

@end

