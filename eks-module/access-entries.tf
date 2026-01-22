data "aws_iam_user" "andrii" {
  user_name = "andrii-user"
}

resource "aws_eks_access_entry" "andrii_user" {
  cluster_name  = aws_eks_cluster.kubernetes_cluster.name
  principal_arn = data.aws_iam_user.andrii.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "andrii_user_admin" {
  cluster_name  = aws_eks_cluster.kubernetes_cluster.name
  principal_arn = data.aws_iam_user.andrii.arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}

data "aws_iam_roles" "github-actions-iam-role" {
  name_regex = "^github-actions-iam-role-for-runner-dev-app-.*"
}

resource "aws_eks_access_entry" "github_actions_iam_role_access" {
  cluster_name  = aws_eks_cluster.kubernetes_cluster.name
  principal_arn = tolist(data.aws_iam_roles.github-actions-iam-role.arns)[0]
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "github_actions_iam_role_policy" {
  cluster_name  = aws_eks_cluster.kubernetes_cluster.name
  principal_arn = tolist(data.aws_iam_roles.github-actions-iam-role.arns)[0]
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
