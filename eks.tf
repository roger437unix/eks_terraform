resource "aws_eks_cluster" "k8s" {
  role_arn = "arn:aws:iam::154460745750:role/c211679a5363312l14817217t1w154460-LabEksClusterRole-whnznS6BP4G2"
  name= var.cluster_name
  version = "1.35"
  vpc_config {
    subnet_ids = ["subnet-0c095739d856c01d7","subnet-0fcfb9cc6cc1020a0", "subnet-0ba532108b49ca776"]   
    endpoint_public_access = true    
  }
}

resource "aws_eks_node_group" "node_group_" {
    cluster_name = aws_eks_cluster.k8s.name
    node_group_name = "node_group_${var.cluster_name}"
    node_role_arn = "arn:aws:iam::154460745750:role/c211679a5363312l14817217t1w154460745-LabEksNodeRole-PP4fUuQbYxon"
    subnet_ids = ["subnet-0c095739d856c01d7","subnet-0fcfb9cc6cc1020a0", "subnet-0ba532108b49ca776"]   
    
    scaling_config {
        desired_size = var.qtde_nodes
        max_size     = 3
        min_size     = 1                
    }

    depends_on = [
        aws_eks_cluster.k8s
    ]
}
