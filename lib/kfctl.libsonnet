{
  Definition(name, namespace, version="v0.7.1"):: {
    kind: "KfDef",
    apiVersion: "kfdef.apps.kubeflow.org/v1beta1",
    metadata: {
      name: name,
      namespace: namespace,
    },
    spec: {
      applications: [],
      version: version,
      repos: [],
    },
  },

  Repo(name, uri):: {
    name: name,
    uri: uri,
  },

  KustomizeConfig(repoPath, repoName="manifests", name="", overlays=[], parameters=[]):: {
    local parts = std.split(repoPath, '/'),
    kustomizeConfig: std.prune({
      name: if name == "" then parts[std.length(parts)-1] else name,
      repoRef: {
        name: repoName,
        path: repoPath,
      },
      parameters: parameters,
      overlays: overlays,
    }),
  },

  Parameter(name, value):: {
    name: name,
    value: value,
  },
}
