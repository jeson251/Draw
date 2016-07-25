//
//  RoundProgressViewController.m
//  ProgressView
//
//  Created by huangjiong on 16/7/25.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "RoundProgressViewController.h"
#import "RoundProgressView1.h"
#import "RoundProgressView2.h"

@interface RoundProgressViewController ()
@property (weak, nonatomic) IBOutlet RoundProgressView1 *progressView1;
@property (weak, nonatomic) IBOutlet RoundProgressView2 *progressView2;
@end

@implementation RoundProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)changeSliderValue:(UISlider *)sender {
    _progressView1.progressValue = sender.value;
    _progressView2.progressValue = sender.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
