//
//  BinaryTreeNode.h
//  AlgorithmSegment
//
//  Created by GrowingIO on 2019/10/4.
//  Copyright © 2019 GeekLee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct TreeNode{
    //  树节点的值
    int m_value;
    //  树的左节点
    struct TreeNode* m_left;
    //  树的右节点
    struct TreeNode* m_right;
    //  树的父节点
    struct TreeNode* m_parent;
    
} *binaryTreeNode;


//  根据一个二叉树的前序遍历序列和中序遍历序列，重建对应的二叉树，返回其根节点
//  preorder 前序遍历序列    inorder 中序遍历序列   length  序列的长度
binaryTreeNode ContructBinaryTree(int *preorder, int *inorder, int length);


//  根据二叉树的一个节点找到其在中序遍历中的写一个节点
//  树中的节点，除了2个分别指向左、右子节点的指针，还有一个指向父节点的指针
binaryTreeNode GetNextTreeNode(binaryTreeNode pNode);


//  判断二叉树中的一棵树是不是另外一棵树的子树
bool HasSubTree(binaryTreeNode pRoot1, binaryTreeNode pRoot2);


//  给定一个整数数组，判断该数组是不是某二叉搜索树的后续遍历结果，如果是，返回 true，不是返回 false
bool VerifySquenceOfBST(int squence[], int length);
