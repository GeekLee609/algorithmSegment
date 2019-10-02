//
//  ListNode.h
//  ListNode
//
//  Created by mia on 2019/10/2.
//  Copyright © 2019年 Geeklee. All rights reserved.
//

#import <Foundation/Foundation.h>

//  首先定义一个链表节点的结构
typedef struct ListNode {
    
    //  节点存储的值
    int nodeValue;
    //  节点存储的指针
    struct ListNode *nextNode;
    
} *pNode;


#pragma mark -listNode 的操作
//  在链表尾部插入一个节点，pHead 是链表的头节点，nodeValue 是待插入节点的值
void insertLsitNode(pNode pHead, int value);

//  删除指定值的节点
void deleteListNode(pNode pHead, int value);

//  删除节点的扩展，如何在 O(1) 的时间内，删除指定的节点
void deleteSpecialNode(pNode pHead, pNode deleteNode);

//  删除链表中的重复节点
void deleteRepeatNode(pNode pHead);

//  从头到尾打印链表的值
void printfAllElementsHead(pNode pHead);

#pragma mark -链表的第二部分
//  寻找链表中倒数第K个节点
pNode findKthToTail(pNode pHead, int k);

//  给定一个链表的头节点，反转该链表并返回头节点
pNode reverseListNode(pNode pHead);

//  合并2个排序的链表
pNode mergeSortedListNode(pNode node1, pNode node2);

//  2个链表中第一个公共的节点？这里的公共节点意味着不仅节点的值相等，指向的后续节点值也相等
pNode firstSameNode(pNode node1, pNode node2);



//  需要注意的是：
//  1、链表的入口是一个头指针
//  2、链表的内存是动态分配的，不存在闲置的存储空间，因此空间利用率比数组高

//  1、从尾到头打印链表
void printfListFromTail(struct ListNode *pHead);


//  2、删除链表中的节点

//  3、链表中倒数第K个节点

//  4、反转链表

//  5、合并2个排序的链表

//  6、2个链表的第一个公共节点

