//
//  ListNode.m
//  ListNode
//
//  Created by mia on 2019/10/2.
//  Copyright © 2019年 Geeklee. All rights reserved.
//

#import "ListNode.h"

void insertLsitNode(pNode pHead, int value) {
    
    pNode p = pHead;
    
    //  生成一个链表节点
    pNode node = (pNode)malloc(sizeof(pNode));
    node->nodeValue = value;
    
    //  如果头节点是 NULL 的话
    if (p == NULL) {
        pHead = node;;
    }
    
    //  遍历链表直接插入到尾部
    while (p->nextNode != NULL) {
        p = p->nextNode;
    }
    //  遍历完成，当前 p->nextNode == NULL，即当前节点 p 是链表的最后一个节点
    p->nextNode = node;
    
}

void deleteListNode(pNode pHead, int value) {
    
    if (pHead == NULL) {
        printf("链表为空");
        return;
    }
    
    //  如果是删除头节点
    if (pHead->nodeValue == value) {
        pHead = pHead->nextNode;
    } else {
        
        pNode tempNode = pHead;
        while (tempNode->nextNode != NULL && tempNode->nextNode->nodeValue != value) {
            tempNode = tempNode->nextNode;
        }
        
        //  如果找到
        if (tempNode->nextNode != NULL && tempNode->nextNode->nodeValue == value) {
            tempNode->nextNode = tempNode->nextNode->nextNode;
            printf("找到待删除值为%d的节点\n", value);
            return;
        }
    }
    
    printf("该节点中不存在值为%d的节点\n", value);
}

void deleteSpecialNode(pNode pHead, pNode deleteNode) {
    
    //  首先处理一些异常的情况
    if (!pHead || !deleteNode) {
        return;
    }
    
    if (deleteNode->nextNode != NULL) {
        //  待删除的节点不是尾节点,那么直接交换后续节点的值
        pNode nextNode = deleteNode->nextNode;
        
        deleteNode->nodeValue = nextNode->nodeValue;
        deleteNode->nextNode = nextNode->nextNode;
        
        //  删除节点并释放内存
        nextNode = NULL;
    } else if (pHead == deleteNode) {
        
        //  删除的是头节点，并且没有后续节点
        deleteNode = NULL;
        pHead = NULL;
        
    } else {
        
        //  另外的情况，删除的最后一个节点，无法交换后续节点的值
        pNode tempNode = pHead;
        while (tempNode->nextNode != deleteNode) {
            tempNode = tempNode->nextNode;
        }
        
        //  此处按理有判断，到底是到达尾节点还是找到待删除的节点，我们假设前提是待删除的节点一定存在于该链表中
        tempNode->nextNode = NULL;
        deleteNode = NULL;
    }
    
}

void deleteRepeatNode(pNode pHead) {
    
    if (pHead == NULL) {
        return;
    }
    
    printf("删除链表中重复的节点\n");
    //  生成一个前向节点的指针
    pNode preNode = NULL;
    
    //  当前的节点
    pNode currentNode = pHead;
    
    while (currentNode != NULL) {
        
        //  下一个节点
        pNode nextNode = currentNode->nextNode;
        BOOL needDelete = false;
        //  判断这个节点的值是否与当前的相等
        if (nextNode != NULL && nextNode->nodeValue == currentNode->nodeValue) {
            needDelete = true;
        }
        
        //  判断是否需要删除
        if (!needDelete) {
            //  节点不重复时
            preNode = currentNode;
            currentNode = nextNode;
        } else {
            //  重复需要删除的
            int value = currentNode->nodeValue;
            //  标记当前为待删除的节点
            pNode deleteNode = currentNode;
            while (deleteNode != NULL && deleteNode->nodeValue == value) {
                
                //  继续遍历
                nextNode = deleteNode->nextNode;
                deleteNode = NULL;
                //  重新赋值给待删除的节点
                deleteNode = nextNode;
            }
            
            if (preNode == NULL) {
                //  一直在删除，更改前向指针
                pHead = nextNode;
            } else {
                //  移动指针
                preNode->nextNode = nextNode;
            }
            currentNode = nextNode;
        }
        
    }
    
}

void printfAllElementsHead(pNode pHead) {
    
    if (pHead == NULL) {
        printf("当前链表为空");
        return;
    }
    
    pNode p = pHead;
    while (p->nextNode != NULL) {
        printf("%d\n", p->nextNode->nodeValue);
        p = p->nextNode;
    }
}


void printfListFromTail_recursive(struct ListNode *pHead) {
    
    
    //  开始递归，如果后续节点不为空则一直递归
    if (pHead != NULL) {

        if (pHead->nextNode != NULL) {
            //  注意递归调用时，存在栈溢出的风险
            printfListFromTail_recursive(pHead->nextNode);
        }
        printf("%d\n", pHead->nodeValue);
    }
}

//  给定一个链表的头节点，如何实现从尾到头打印该链表的所有元素
void printfListFromTail(struct ListNode *pHead) {
    
    //  1、借助一个栈，遍历链表，存入栈中，遍历完成后，开始出栈，此时时间复杂度是 O(n)，空间复杂度是 O(n)
    
    //  2、是否还有其他的方法？第一个方法用的是栈，递归在本质上就是一个栈，是否可以借助递归来实现这个
    printf("开始递归从后遍历链表\n");
    printfListFromTail_recursive(pHead);

}

#pragma mark - 链表的相关操作，第二部分

//  思考如下：
//  1、可以尝试用入栈出栈的方式来获取倒数第K个节点，需要遍历一次链表，O(n)的额外空间复杂度
//  2、可以遍历一次链表，获取其长度 n，倒数第 K 个节点，即顺序遍历的第 n-k+1 的节点，需要遍历2次链表
//  3、较优解法：设置2个次查找，间隔为 K，当第一个查找时指向为 NULL 时，此时另外一个指向的节点就是倒数第 K 个节点

pNode findKthToTail(pNode pHead, int k) {
    
    //  这里只写第3种解法，异常判断
    if (pHead == NULL || k < 1) {
        return NULL;
    }
    
    //  设置2个步长间隔为 K 的查找节点
    int first = 0;
    pNode firstNode = pHead;
    pNode secondNode = pHead;
    
    while (firstNode->nextNode != NULL) {
      
        if (first >= k-1) {
            secondNode = secondNode->nextNode;
        }
        firstNode = firstNode->nextNode;
         ++first;
    }
    //  判断当前长度是否符合大于等于 k
    if (first >= k - 1) {
        return secondNode;
    }
    return NULL;
}

//  链表的反转思考
//  1、用一个栈来保存该链表的节点
//  2、保存前一个节点
pNode reverseListNode(pNode pHead) {
    
    //  设置3个节点，前向节点-当前节点-后续节点
    pNode preNode = NULL;
    pNode currentNode = pHead;
    pNode reverseHeadNode = NULL;
    
    while (currentNode != NULL) {
        
        pNode node = currentNode->nextNode;
        if (node == NULL) {
            //  node 节点为尾节点，即为反转后的头节点
            reverseHeadNode = currentNode;
        }
        
        //  前向节点为反转后的后续节点
        currentNode->nextNode = preNode;
        //  保存当前的节点作为前向节点
        preNode = currentNode;
        //  当前节点往后遍历
        currentNode =  node;
        
    }
    return reverseHeadNode;
    
}

pNode mergeSortedListNode(pNode pHead1, pNode pHead2) {
    
    if (pHead1 == NULL) {
        return pHead2;
    } else if (pHead2 == NULL) {
        return pHead1;
    }
    
    //  其他情况下返回合并的头节点
    pNode mergerHead = NULL;
    
    //  递归返回下一个节点
    if (pHead1->nodeValue <= pHead2->nodeValue) {
        
        mergerHead = pHead1;
        mergerHead->nextNode = mergeSortedListNode(pHead1->nextNode, pHead2);
        
    } else {
        mergerHead = pHead2;
        mergerHead->nextNode = mergeSortedListNode(pHead1, pHead2->nextNode);
    }
    
    return mergerHead;
    
}

//  获取链表长度的函数
int getLengthNode(pNode pHead);

pNode firstSameNode(pNode node1, pNode node2) {
    
    //  第一种思路是用 2 个栈分别存储 2 个链表中的值，出栈后比较第一个不相等的节点就是第一个公共节点。需要 2 个额外的栈空间，若 2 个链表的长度分别是 m 和 n 时，此时时间复杂度是 O(m+n),空间复杂度是 O(m+n)
    
    //  第二种思路，直接顺序比较一个相等的节点（问题在于长度不一致时，如何同步查找）
    int nodeLength1 = getLengthNode(node1);
    int nodeLength2 = getLengthNode(node2);
    int lengthDif = 0;
    
    pNode nodeLong = node1;
    pNode nodeShort = node2;
    
    if (nodeLength1 >= nodeLength2) {
        nodeLong = node1;
        nodeShort = node2;
        lengthDif = nodeLength1 - nodeLength2;
    } else {
        nodeLong = node2;
        nodeShort = node1;
        lengthDif = nodeLength2 - nodeLength1;
    }
    
    //  较长的链表先查找
    for (int i = 0; i < lengthDif; ++i) {
        nodeLong = nodeLong->nextNode;
    }
    
    //  开始同长度查找
    while (nodeLong->nextNode != NULL && nodeShort->nextNode != NULL && nodeLong->nodeValue != nodeShort->nodeValue) {
        nodeLong = nodeLong->nextNode;
        nodeShort = nodeShort->nextNode;
    }
    //  获取第一个公共节点
    return nodeLong;
}

int getLengthNode(pNode pHead) {
    
    int length = 0;
    pNode node = pHead;
    while (node->nextNode) {
        ++length;
        node = node->nextNode;
    }
    return length;
}

