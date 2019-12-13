{
  Definition(name, namespace, repoUri, repoName="manifests", version="v0.7.0"):: {
    local defaultRepo = {
      name: repoName,
      uri: repoUri,
    },

    kind: "KfDef",
    apiVersion: "kfdef.apps.kubeflow.org/v1beta1",
    metadata: {
      name: name,
      namespace: namespace,
    },
    spec: {
      applications: [],
      version: version,
      repos: [defaultRepo],
    },
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
