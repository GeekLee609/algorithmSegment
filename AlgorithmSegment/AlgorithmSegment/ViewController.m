//
//  ViewController.m
//  AlgorithmSegment
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "ViewController.h"
#import "GLAlgorithmManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arrayName = @[@"lin",@"hh"];
    NSInteger ii = [GLAlgorithmManager playGameArray:arrayName flagNumber:6];
    
    NSLog(@"最初的位置是%zd",ii);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
