//
//  ViewController.m
//  scrollviewtest
//
//  Created by Sascha Mundstein on 6/20/13.
//  Copyright (c) 2013 Sascha Mundstein. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIScrollView *sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    sv.pagingEnabled = YES;
    self.scrollView = sv;
    
    self.scrollView.contentSize = CGSizeMake(sv.frame.size.width*2, sv.frame.size.height);
    
    for (int i = 0; i< 2; i++) {
        CGRect svFrame= self.view.bounds;
        svFrame.origin.x = i*self.scrollView.bounds.size.width;
        UIScrollView *sv2 = [[UIScrollView alloc] initWithFrame:svFrame];
        sv2.pagingEnabled = YES;
        sv2.contentSize = CGSizeMake(svFrame.size.width, svFrame.size.height*2);
        [self.scrollView addSubview:sv2];
        sv2.backgroundColor = i==0 ? UIColor.redColor : UIColor.orangeColor;
        for (int j=0; j<2; j++) {
            UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, sv.bounds.size.height*j, sv2.bounds.size.width, sv2.bounds.size.height)];
            [sv2 addSubview:v];
            v.backgroundColor = j==0 ? (i==0 ? UIColor.yellowColor : UIColor.magentaColor) : UIColor.clearColor;
        }
    }
    
    [self.view addSubview:sv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
