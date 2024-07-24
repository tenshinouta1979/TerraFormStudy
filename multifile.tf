resource "aws_iam_user" "example" {
  name = "readonly_user"
  path = "/system/"
}

resource "aws_iam_user_policy_attachment" "example" {
  user       = aws_iam_user.example.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
