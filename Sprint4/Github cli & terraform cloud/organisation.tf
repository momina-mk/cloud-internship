terraform {
  cloud {
    organization = "momina"

    workspaces {
      name = "my-workspace"
    }
  }
}