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
}
