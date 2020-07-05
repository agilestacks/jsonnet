{
  Definition(name, namespace, version="v1.0.2", apiVersion="kfdef.apps.kubeflow.org/v1"):: {
    kind: "KfDef",
    apiVersion: apiVersion,
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
  
  NameValue(name, value):: {
    name: name,
    value: value,
  },

  KustomizeConfig(repoPath, repoName="manifests", name="", overlays=[], parameters=[]):: {
    local parts = std.split(repoPath, '/'),
    local toNameValue(key) = {name: key, value: parameters[key]},
    
    kustomizeConfig: std.prune({
      repoRef: {
        name: repoName,
        path: repoPath,
      },
      parameters:  if std.isObject(parameters) 
        then std.map(toNameValue, std.objectFields(parameters))
        else parameters,
      overlays: overlays,
    }),
    name: if name == "" then parts[std.length(parts)-1] else name,
  },
}
