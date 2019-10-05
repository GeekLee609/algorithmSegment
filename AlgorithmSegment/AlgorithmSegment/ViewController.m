//
//  ViewController.m
//  AlgorithmSegment
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "ViewController.h"
#import "GLAlgorithmManager.h"
#import "ListNode.h"
#import "BinaryTreeNode.h"

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
    
    int s1[] = {1,2,4,7,3,5,6,8};
    int s2[] = {4,7,2,1,5,3,8,6};
    
//    int s3[] = {5,7,6,9,11,10,8};
    int s3[] = {7,4,6,5};
    bool kk = VerifySquenceOfBST(s3, 4);
    
    
    
    binaryTreeNode treeNode = ContructBinaryTree(s1, s2, 8);
    
    
}


- (void)listOperate {
    
    pNode pHead1 = (pNode)malloc(sizeof(pNode));
    pHead1->nextNode = NULL;
    //  链表尾部插入节点
    insertLsitNode(pHead1, 1);
    insertLsitNode(pHead1, 3);
    insertLsitNode(pHead1, 5);
    insertLsitNode(pHead1, 7);
    
    pNode pHead2 = (pNode)malloc(sizeof(pNode));
    pHead2->nextNode = NULL;
    insertLsitNode(pHead2, 9);
    insertLsitNode(pHead2, 2);
    insertLsitNode(pHead2, 3);
    insertLsitNode(pHead2, 5);
    insertLsitNode(pHead2, 7);
    
    pNode sameNode = firstSameNode(pHead1, pHead2);
    
    printfAllElementsHead(pHead1);
}


@end
