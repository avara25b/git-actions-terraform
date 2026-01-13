data "aws_iam_user" "andrii" {
  user_name = "andrii-user"
}

resource "aws_eks_access_entry" "andrii_user" {
  cluster_name  = aws_eks_cluster.kubernetes_cluster.name
  principal_arn = data.aws_iam_user.andrii.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "andrii_user_view" {
  cluster_name  = aws_eks_cluster.kubernetes_cluster.name
  principal_arn = data.aws_iam_user.andrii.arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminViewPolicy"

  access_scope {
    type = "cluster"
  }
}
