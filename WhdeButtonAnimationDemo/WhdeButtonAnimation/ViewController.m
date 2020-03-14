//
//  ViewController.m
//  WhdeButtonAnimation
//
//  Created by whde on 16/5/13.
//  Copyright © 2016年 whde. All rights reserved.
//

#import "ViewController.h"
#import "WhdeButtonAnimation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"IMG_0808"]];*/
    // Do any additional setup after loading the view, typically from a nib.
    WhdeButtonAnimation *btn = [WhdeButtonAnimation buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor greenColor]];
    btn.frame = CGRectMake(0, 0, 260, 80);
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.center = self.view.center;
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


