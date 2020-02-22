{
  ingress(name):: {
    kind: "Ingress",
    apiVersion: "extensions/v1beta1",
    metadata: {
      name: name,
      annotations: {},
      labels: {},
    },
    spec: {
      rules: [],
    },
  },

  secret(name, type="Opaque"):: {
    kind: "Secret",
    apiVersion: "v1",
    type: type,
    metadata: {
      name: name,
      annotations: {},
      labels: {},
    },
    data: {},
  },

  service(name, type="ClusterIP", ports=[],):: {
    kind: "Service",
    apiVersion: "v1",
    spec: {
      type: type,
      ports: [
        { port: p }
        for p in ports
      ],
    },
    metadata: {
      name: name,
      annotations: {},
      labels: {},
    },
    
  },

  deployment(name,replicas=1):: {
    kind: "Deployment",
    apiVersion: "apps/v1",
    spec: {
      replicas: replicas,
      selector: {
        matchLabels: {
          app: name
        },
      },
      template: {
        metadata: {
          labels: {
            app: name
          },
        },
        spec: {
          initContainers: [],
          containers: [],
        },
      },
    },
    metadata: {
      name: name,
      annotations: {},
      labels: {},
    },
  },

  container(name, image, imagePullPolicy="Always", ports=[],command=[],):: {
    name: name,
    image: image,
    imagePullPolicy: imagePullPolicy,
    env: [],
    command: command,
    ports: [
      { containerPort: p }
      for p in ports
    ],
    resources: {
      limits: {},
    },
  },

  ingressRule(host, serviceName, servicePort=80, path="/"):: {
    host: host,
    http: {
      paths: [
        {
          path: "/", 
          backend: {
            serviceName: serviceName, 
            servicePort: servicePort,
          }
        },
      ]
    }
  },
  envVar(name, value=""):: {
    name: name,
    value: if value == "" then std.extVar(name) else value,
  },
}
