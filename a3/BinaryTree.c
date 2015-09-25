#include <stdlib.h>
#include <stdio.h>

//
// A binary tree node with value and left and right children
struct Node {
  int value;
  struct Node* left;
  struct Node* right;


};

 struct Node* newNode (int value){
struct Node* n = malloc (sizeof (struct Node));
n->left = NULL;
n->right = NULL;
n->value = value;
return n;

}
//
// Insert node n into tree rooted at toNode
//
void insertNode (struct Node* toNode, struct Node* n) {

    if(n->value <= toNode->value){
    if(toNode->left == NULL)
    toNode->left = n;
    else
    insertNode(toNode->left,n);
    }
    else {
    if(toNode->right == NULL)

    toNode->right = n;
    else
    insertNode(toNode->right,n);
    }
}

//
// Insert new node with specified value into tree rooted at toNode
//
void insert (struct Node* toNode, int value) {
  insertNode(toNode, newNode(value));


}


//
// Print values of tree rooted at node in ascending order
//
void printInOrder (struct Node* node) {
  if(node->left != NULL)
  printInOrder(node->left);
  printf ("%d\n", node->value);
  if(node->right != NULL)
  printInOrder(node->right);

}

//
// Create root node, insert some values, and print tree in order
//
int main (int argc, char* argv[]) {
    struct Node* n = newNode(100);
    insert(n,(10));
    insert(n,(120));
    insert(n,(130));
    insert(n,(90));
    insert(n,(5));
    insert(n,(95));
    insert(n,(121));
    insert(n,(131));
    insert(n,(1));
    printInOrder(n);


}