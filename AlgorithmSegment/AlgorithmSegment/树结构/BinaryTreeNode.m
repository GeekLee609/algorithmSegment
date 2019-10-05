//
//  BinaryTreeNode.m
//  AlgorithmSegment
//
//  Created by GrowingIO on 2019/10/4.
//  Copyright © 2019 GeekLee. All rights reserved.
//

#import "BinaryTreeNode.h"

binaryTreeNode ContructBinaryTreeCore(int *startPreorder, int *endPreorder, int *startInorder, int *endInorder) {
    
    //  根据前序遍历和中序遍历来恢复一个二叉树
    
    //  获得如下信息 1、前序遍历的第一个节点是“根节点”，获取“根节点”之后在中序遍历查找该节点，在中序遍历中该节点前面的都是 左子树
    
    //  求出根节点的值
    int rootValue = startPreorder[0];
    
    //  然后去找左右子树
    
    //  先构造一个树节点
    binaryTreeNode rootNode = (binaryTreeNode)malloc(sizeof(binaryTreeNode));
    rootNode->m_value = rootValue;
    //  首先假设左右子树都是空
    rootNode->m_left = NULL;
    rootNode->m_right = NULL;
    
    //  只有一个节点的时候
    if (startPreorder == endPreorder) {
        //  序列中只有一个节点时，并且前序和中序节点值相等，则返回这个节点
        if (startInorder == endInorder && *startPreorder == *startInorder) {
            return rootNode;
        } else {
            printf("节点只有一个，且前序和中序不对应-Input error!");
            return NULL;
        }
    }
    
    //  在中序遍历中找到根节点的值
    int *rootValueInorder = startInorder;
    while (rootValueInorder <= endInorder && *rootValueInorder != rootValue) {
        //  在中序序列中进行指针的地址移动，找到对应的根节点
        ++rootValueInorder;
    }
    
    //  找到末尾依然没有找到对应的根节点
    if (rootValueInorder == endInorder && *rootValueInorder != rootValue) {
        printf("中序序列中，不存在对应的根节点-Input error!");
        return NULL;
    }
    
    //  找到对应的根节点，长度为对应左子树的长度
    long leftTreeLength = rootValueInorder - startInorder;
    
    //  对应根节点的指针位置
    int *leftPreorderEnd = startPreorder + leftTreeLength;
    
    if (leftTreeLength > 0) {
        // 构建左子树
        rootNode->m_left = ContructBinaryTreeCore(startPreorder + 1, leftPreorderEnd, startInorder, rootValueInorder - 1);
    }
    
    if (leftTreeLength < endPreorder - startPreorder) {
        // 构建右子树
        rootNode->m_right = ContructBinaryTreeCore(leftPreorderEnd + 1, endPreorder, rootValueInorder + 1, endInorder);
    }
    
    return rootNode;
}

binaryTreeNode ContructBinaryTree(int *preorder, int *inorder, int length) {
    
    //  首先进行异常判断
    if (preorder == NULL || inorder == NULL || length <= 0) {
        printf("输入的序列为空");
        return NULL;
    }
    
    return ContructBinaryTreeCore(preorder, preorder + length - 1, inorder, inorder + length - 1);
}


//   主要有以下几种情况
//   1、在中序遍历中，如果一个节点有右子树的话，那么他的下一个节点就是右子树中的最左子节点，那么这种情况如何处理
//  从当前节点的右子节点出发，一直沿着左子节点的指针就能找到对应的中序遍历中的下一个节点


//  2、在中序遍历中，如果给定的一个节点没有右子树的话，如何处理？此处有2种情况，
//  2.a：他是父节点的右子节点  沿着指向父节点的指针一直向上遍历，直到找到一个节点，这个节点是他父节点的左子节点，那么这个节点的父节点就是我们要找的下一个节点
//  2.b：他是父节点的左子节点，那么在中序遍历中，他的下一个节点就是他的父节点

binaryTreeNode GetNextTreeNode(binaryTreeNode pNode) {
    
    //  首先异常处理
    if (pNode == NULL) {
        printf("当前的节点为空");
        return NULL;
    }
    
    binaryTreeNode pNext = NULL;
    
    if (pNode->m_right) {
        //  有右子树的情况，一直沿着当前节点的右子节点的左子节点指针遍历，找到最后一个不为空的节点即可
        binaryTreeNode pRight = pNode->m_right;
        while (pRight->m_left != NULL) {
            pRight = pRight->m_left;
        }
        pNext = pRight;
        
    } else {
        //  没有右子树的情况，此时判断当前节点是其父节点的左子节点还是右子节点
        if (pNode == pNode->m_parent->m_left) {
            //  是其父节点的左子节点，那么在中序遍历中，当前节点的下一个节点就是其父节点
            pNext = pNode->m_parent;
        } else {
            //  当前节点没有右子树并且是其父节点的右子节点，一直沿着父节点查找，直到找到一个节点，且这个节点是其父节点的左子节点
            binaryTreeNode currentNode = pNode->m_parent;
            while (currentNode != NULL) {
                // 如果是当前父节点的右子节点时，继续遍历
                if (currentNode != currentNode->m_parent->m_left) {
                    // 继续查找父节点
                    currentNode = currentNode->m_parent;
                } else {
                    // 返回其父节点，结束当前 while 循环
                    pNext = currentNode->m_parent;
                    break;
                }
            }
        }
    }
    return pNext;
}



//  注意判断2个 double 类型的数值是否相等
bool Equal(double num1, double num2);
bool DoesTree1HaveTree2(binaryTreeNode pRoot1, binaryTreeNode pRoot2);

bool HasSubTree(binaryTreeNode pRoot1, binaryTreeNode pRoot2) {
    
    bool result = false;
    
    //   异常处理，pRoot1 和 pRoot2 同时都不为 NULL
    if (pRoot1 != NULL && pRoot2 != NULL) {
        
        //   如果在根节点就相等
        if (Equal(pRoot1->m_value, pRoot2->m_value)) {
            result = DoesTree1HaveTree2(pRoot1, pRoot2);
        }
        
        //   再依次判断其左、右子树是否包含子树
        if (!result) {
            //  遍历其左子树
            result = HasSubTree(pRoot1->m_left, pRoot2);
        }
        
        if (!result) {
            //  遍历其右子树
            result = HasSubTree(pRoot1->m_right, pRoot2);
        }
    }

    return result;
}

bool Equal(double num1, double num2) {
    
    //  判断2个 double 类型的值相等
    if ((num1 - num2 > -0.0000001 && num1 - num2 < 0.0000001)) {
        return true;
    } else {
        return false;
    }
    
}

bool DoesTree1HaveTree2(binaryTreeNode pRoot1, binaryTreeNode pRoot2) {
    
    // 异常判断，递归的终止条件，要查找的子树的节点是空
    if (pRoot2 == NULL) {
        return true;
    }
    
    //  异常不相等的判断
    if (pRoot1 == NULL) {
        return false;
    }
    
    if (!Equal(pRoot1->m_value, pRoot2->m_value)) {
        return false;
    }
    
    //  继续判断子节点是否相等
    return DoesTree1HaveTree2(pRoot1->m_left, pRoot2->m_left) && DoesTree1HaveTree2(pRoot1->m_right, pRoot2->m_right);
}


//   二叉搜索树的特点，父节点的值大于其左子树上所有节点的值，小于其右子树上所有子节点的值
//   后序遍历，最后一个数是 根节点
bool VerifySquenceOfBST(int squence[], int length) {
    
    //  首先找到 根 节点
    if (squence == NULL || length <= 0) {
        return false;
    }
    
    //  找到 根 节点上的值
    int root = squence[length - 1];
    
    int i = 0;
    for (; i < length - 1; ++i) {
        if (squence[i] > root) {
            //  立即跳出当前循环，找到所有的 左子树 节点
            break;
        }
    }
    
    int j = i;
    for (; j < length - 1; ++j) {
        if (squence[j] < root) {
            //  其右子树中含有小于 根 节点的值
            return false;
        }
    }
    
    // 找到其左子树和右子树
    
    //  判断 左子树 是不是二叉搜索树
    bool left = true;
    if (i > 0) {
        left = VerifySquenceOfBST(squence, i);
    }
    
    //  判断 右子树 是不是二叉搜索树
    bool right = true;
    if (i < length - 1) {
        right = VerifySquenceOfBST(squence + i, length - i - 1);
    }
    
    return (left && right);
    
}
