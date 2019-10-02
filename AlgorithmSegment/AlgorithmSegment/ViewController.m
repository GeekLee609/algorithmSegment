//
//  ViewController.m
//  AlgorithmSegment
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "ViewController.h"
#import "GLAlgorithmManager.h"
#import "ListNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arrayName = @[@"lin",@"hh"];
    NSInteger ii = [GLAlgorithmManager playGameArray:arrayName flagNumber:6];
    
    NSLog(@"最初的位置是%zd",ii);
    [self listOperate];
    
}


- (void)listOperate {
    
    pNode pHead1 = (pNode)malloc(sizeof(pNode));
    //  链表尾部插入节点
    insertLsitNode(pHead1, 1);
    insertLsitNode(pHead1, 3);
    insertLsitNode(pHead1, 5);
    insertLsitNode(pHead1, 7);
    
    pNode pHead2 = (pNode)malloc(sizeof(pNode));
    insertLsitNode(pHead2, 9);
    insertLsitNode(pHead2, 2);
    insertLsitNode(pHead2, 3);
    insertLsitNode(pHead2, 5);
    insertLsitNode(pHead2, 7);
    
    pNode sameNode = firstSameNode(pHead1, pHead2);
    
    printfAllElementsHead(pHead1);
}


@end
