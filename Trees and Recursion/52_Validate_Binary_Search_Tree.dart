class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val, [this.left, this.right]);
}

bool isValidBST(TreeNode? root, [int? min, int? max]) {
  if (root == null) return true;
  if ((min != null && root.val <= min) || (max != null && root.val >= max)) {
    return false;
  }
  return isValidBST(root.left, min, root.val) &&
      isValidBST(root.right, root.val, max);
}

void main() {
  TreeNode root = TreeNode(2, TreeNode(1), TreeNode(3));
  bool out = isValidBST(root);
  print(out);
}
