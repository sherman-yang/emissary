module github.com/datawire/ambassador/v2

go 1.17

// If you're editing this file, there's a few things you should know:
//
//  1. Avoid the `replace` command as much as possible.  Go only pays
//     attention to the `replace` command when it appears in the main
//     module, which means that if the `replace` command is required
//     for the compile to work, then anything using ambassador.git as
//     a library needs to duplicate that `replace` in their go.mod.
//     We don't want to burden our users with that if we can avoid it
//     (since we encourage them to use the gRPC Go libraries when
//     implementing plugin services), and we don't want to deal with
//     that ourselves in apro.git.
//
//     The biggest reason we wouldn't be able to avoid it is if we
//     need to pull in a library that has a `replace` in its
//     go.mod--just as us adding a `replace` to our go.mod would
//     require our dependents to do the same, our dependencies adding
//     a `replace` requires us to do the same.  And even then, if
//     we're careful we might be able to avoid it.
//
//  2. If you do add a `replace` command to this file, always include
//     a version number to the left of the "=>" (even if you're
//     copying the command from a dependnecy and the dependency's
//     go.mod doesn't have a version on the left side).  This way we
//     don't accidentally keep pinning to an older version after our
//     dependency's `replace` goes away.  Sometimes it can be tricky
//     to figure out what version to put on the left side; often the
//     easiest way to figure it out is to get it working without a
//     version, run `go mod vendor`, then grep for "=>" in
//     `./vendor/modules.txt`.  If you don't see a "=>" line for that
//     replacement in modules.txt, then that's an indicator that we
//     don't really need that `replace`, maybe instead using a
//     `require`.
//
//  3. If you do add a `replace` command to this file, you must also
//     add it to the go.mod in apro.git (see above for explanation).

// Because we (unfortunately) need to require k8s.io/kubernetes, which
// is (unfortunately) managed in a way that makes it hostile to being
// used as a library (see
// https://news.ycombinator.com/item?id=27827389) we need to tell Go
// to not try to resolve those bogus/broken v0.0.0 versions.
exclude (
	k8s.io/api v0.0.0
	k8s.io/apiextensions-apiserver v0.0.0
	k8s.io/apimachinery v0.0.0
	k8s.io/apiserver v0.0.0
	k8s.io/cli-runtime v0.0.0
	k8s.io/client-go v0.0.0
	k8s.io/cloud-provider v0.0.0
	k8s.io/cluster-bootstrap v0.0.0
	k8s.io/code-generator v0.0.0
	k8s.io/component-base v0.0.0
	k8s.io/component-helpers v0.0.0
	k8s.io/controller-manager v0.0.0
	k8s.io/cri-api v0.0.0
	k8s.io/csi-translation-lib v0.0.0
	k8s.io/kube-aggregator v0.0.0
	k8s.io/kube-controller-manager v0.0.0
	k8s.io/kube-proxy v0.0.0
	k8s.io/kube-scheduler v0.0.0
	k8s.io/kubectl v0.0.0
	k8s.io/kubelet v0.0.0
	k8s.io/legacy-cloud-providers v0.0.0
	k8s.io/metrics v0.0.0
	k8s.io/mount-utils v0.0.0
	k8s.io/sample-apiserver v0.0.0
)

// Invalid pseudo-version.
exclude github.com/go-check/check v1.0.0-20180628173108-788fd7840127

// Temporarily exclude all newer versions of packages we don't want to upgrade.
exclude (
	github.com/go-logr/logr v1.0.0
	github.com/go-logr/logr v1.1.0
	github.com/go-logr/logr v1.2.0
	github.com/go-logr/logr v1.2.1
	github.com/go-logr/logr v1.2.2
	k8s.io/api v0.22.0
	k8s.io/api v0.22.1
	k8s.io/api v0.22.2
	k8s.io/api v0.22.3
	k8s.io/api v0.22.4
	k8s.io/api v0.22.5
	k8s.io/api v0.22.6
	k8s.io/api v0.23.0
	k8s.io/api v0.23.1
	k8s.io/api v0.23.2
	k8s.io/api v0.23.3
	k8s.io/apiextensions-apiserver v0.22.0
	k8s.io/apiextensions-apiserver v0.22.1
	k8s.io/apiextensions-apiserver v0.22.2
	k8s.io/apiextensions-apiserver v0.22.3
	k8s.io/apiextensions-apiserver v0.22.4
	k8s.io/apiextensions-apiserver v0.22.5
	k8s.io/apiextensions-apiserver v0.22.6
	k8s.io/apiextensions-apiserver v0.23.0
	k8s.io/apiextensions-apiserver v0.23.1
	k8s.io/apiextensions-apiserver v0.23.2
	k8s.io/apiextensions-apiserver v0.23.3
	k8s.io/apimachinery v0.22.0
	k8s.io/apimachinery v0.22.1
	k8s.io/apimachinery v0.22.2
	k8s.io/apimachinery v0.22.3
	k8s.io/apimachinery v0.22.4
	k8s.io/apimachinery v0.22.5
	k8s.io/apimachinery v0.22.6
	k8s.io/apimachinery v0.23.0
	k8s.io/apimachinery v0.23.1
	k8s.io/apimachinery v0.23.2
	k8s.io/apimachinery v0.23.3
	k8s.io/apiserver v0.22.0
	k8s.io/apiserver v0.22.1
	k8s.io/apiserver v0.22.2
	k8s.io/apiserver v0.22.3
	k8s.io/apiserver v0.22.4
	k8s.io/apiserver v0.22.5
	k8s.io/apiserver v0.22.6
	k8s.io/apiserver v0.23.0
	k8s.io/apiserver v0.23.1
	k8s.io/apiserver v0.23.2
	k8s.io/apiserver v0.23.3
	k8s.io/cli-runtime v0.22.0
	k8s.io/cli-runtime v0.22.1
	k8s.io/cli-runtime v0.22.2
	k8s.io/cli-runtime v0.22.3
	k8s.io/cli-runtime v0.22.4
	k8s.io/cli-runtime v0.22.5
	k8s.io/cli-runtime v0.22.6
	k8s.io/cli-runtime v0.23.0
	k8s.io/cli-runtime v0.23.1
	k8s.io/cli-runtime v0.23.2
	k8s.io/cli-runtime v0.23.3
	k8s.io/client-go v0.22.0
	k8s.io/client-go v0.22.1
	k8s.io/client-go v0.22.2
	k8s.io/client-go v0.22.3
	k8s.io/client-go v0.22.4
	k8s.io/client-go v0.22.5
	k8s.io/client-go v0.22.6
	k8s.io/client-go v0.23.0
	k8s.io/client-go v0.23.1
	k8s.io/client-go v0.23.2
	k8s.io/client-go v0.23.3
	k8s.io/code-generator v0.22.0
	k8s.io/code-generator v0.22.1
	k8s.io/code-generator v0.22.2
	k8s.io/code-generator v0.22.3
	k8s.io/code-generator v0.22.4
	k8s.io/code-generator v0.22.5
	k8s.io/code-generator v0.22.6
	k8s.io/code-generator v0.23.0
	k8s.io/code-generator v0.23.1
	k8s.io/code-generator v0.23.2
	k8s.io/code-generator v0.23.3
	k8s.io/component-base v0.22.0
	k8s.io/component-base v0.22.1
	k8s.io/component-base v0.22.2
	k8s.io/component-base v0.22.3
	k8s.io/component-base v0.22.4
	k8s.io/component-base v0.22.5
	k8s.io/component-base v0.22.6
	k8s.io/component-base v0.23.0
	k8s.io/component-base v0.23.1
	k8s.io/component-base v0.23.2
	k8s.io/component-base v0.23.3
	k8s.io/component-helpers v0.22.0
	k8s.io/component-helpers v0.22.1
	k8s.io/component-helpers v0.22.2
	k8s.io/component-helpers v0.22.3
	k8s.io/component-helpers v0.22.4
	k8s.io/component-helpers v0.22.5
	k8s.io/component-helpers v0.22.6
	k8s.io/component-helpers v0.23.0
	k8s.io/component-helpers v0.23.1
	k8s.io/component-helpers v0.23.2
	k8s.io/component-helpers v0.23.3
	k8s.io/gengo v0.0.0-20210813121822-485abfe95c7c
	k8s.io/klog/v2 v2.20.0
	k8s.io/klog/v2 v2.30.0
	k8s.io/klog/v2 v2.40.0
	k8s.io/klog/v2 v2.40.1
	k8s.io/kube-openapi v0.0.0-20220124234850-424119656bbf
	k8s.io/kubectl v0.22.0
	k8s.io/kubectl v0.22.1
	k8s.io/kubectl v0.22.2
	k8s.io/kubectl v0.22.3
	k8s.io/kubectl v0.22.4
	k8s.io/kubectl v0.22.5
	k8s.io/kubectl v0.22.6
	k8s.io/kubectl v0.23.0
	k8s.io/kubectl v0.23.1
	k8s.io/kubectl v0.23.2
	k8s.io/kubectl v0.23.3
	k8s.io/kubernetes v1.22.0
	k8s.io/kubernetes v1.22.1
	k8s.io/kubernetes v1.22.2
	k8s.io/kubernetes v1.22.3
	k8s.io/kubernetes v1.22.4
	k8s.io/kubernetes v1.22.5
	k8s.io/kubernetes v1.22.6
	k8s.io/kubernetes v1.23.0
	k8s.io/kubernetes v1.23.1
	k8s.io/kubernetes v1.23.2
	k8s.io/kubernetes v1.23.3
	k8s.io/metrics v0.22.0
	k8s.io/metrics v0.22.1
	k8s.io/metrics v0.22.2
	k8s.io/metrics v0.22.3
	k8s.io/metrics v0.22.4
	k8s.io/metrics v0.22.5
	k8s.io/metrics v0.22.6
	k8s.io/metrics v0.23.0
	k8s.io/metrics v0.23.1
	k8s.io/metrics v0.23.2
	k8s.io/metrics v0.23.3
	k8s.io/utils v0.0.0-20210819203725-bdf08cb9a70a
	k8s.io/utils v0.0.0-20220127004650-9b3446523e65
	sigs.k8s.io/controller-runtime v0.10.0
	sigs.k8s.io/controller-runtime v0.10.1
	sigs.k8s.io/controller-runtime v0.10.2
	sigs.k8s.io/controller-runtime v0.10.3
	sigs.k8s.io/controller-runtime v0.11.0
	sigs.k8s.io/gateway-api v0.3.0
	sigs.k8s.io/gateway-api v0.4.0
	sigs.k8s.io/gateway-api v0.4.1
	sigs.k8s.io/kustomize/api v0.10.0
	sigs.k8s.io/kustomize/api v0.10.1
	sigs.k8s.io/kustomize/api v0.11.0
	sigs.k8s.io/kustomize/api v0.11.1
	sigs.k8s.io/kustomize/api v0.8.10
	sigs.k8s.io/kustomize/api v0.8.11
	sigs.k8s.io/kustomize/api v0.8.9
	sigs.k8s.io/kustomize/api v0.9.0
	sigs.k8s.io/kustomize/kyaml v0.10.18
	sigs.k8s.io/kustomize/kyaml v0.10.19
	sigs.k8s.io/kustomize/kyaml v0.10.20
	sigs.k8s.io/kustomize/kyaml v0.10.21
	sigs.k8s.io/kustomize/kyaml v0.11.0
	sigs.k8s.io/kustomize/kyaml v0.11.1
	sigs.k8s.io/kustomize/kyaml v0.12.0
	sigs.k8s.io/kustomize/kyaml v0.13.0
	sigs.k8s.io/kustomize/kyaml v0.13.1
	sigs.k8s.io/kustomize/kyaml v0.13.2
	sigs.k8s.io/kustomize/kyaml v0.13.3
)

// We've got some bug-fixes that we need for conversion-gen and
// controller-gen.
replace (
	k8s.io/code-generator v0.21.9 => github.com/emissary-ingress/code-generator v0.21.10-rc.0.0.20220204004229-4708b255a33a
	sigs.k8s.io/controller-tools v0.6.2 => github.com/emissary-ingress/controller-tools v0.6.3-0.20220204053320-db507acbb466
)

require (
	github.com/Masterminds/sprig v2.22.0+incompatible
	github.com/argoproj/argo-rollouts v1.0.7
	github.com/census-instrumentation/opencensus-proto v0.2.1
	github.com/cncf/udpa/go v0.0.0-20210322005330-6414d713912e
	github.com/datawire/dlib v1.2.5-0.20211116212847-0316f8d7af2b
	github.com/datawire/dtest v0.0.0-20210927191556-2cccf1a938b0
	github.com/datawire/go-mkopensource v0.0.0-20220121154707-b0476e7f8255
	github.com/envoyproxy/protoc-gen-validate v0.3.0-java.0.20200609174644-bd816e4522c1
	github.com/fsnotify/fsnotify v1.4.9
	github.com/getkin/kin-openapi v0.66.0
	github.com/golang/protobuf v1.5.2
	github.com/google/go-cmp v0.5.6
	github.com/google/uuid v1.1.2
	github.com/gorilla/websocket v1.4.2
	github.com/hashicorp/consul/api v1.3.0
	github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51
	github.com/pkg/errors v0.9.1
	github.com/pmezard/go-difflib v1.0.0
	github.com/prometheus/client_model v0.2.0
	github.com/sirupsen/logrus v1.8.1
	github.com/spf13/cobra v1.2.1
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.7.0
	golang.org/x/mod v0.5.1
	golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
	google.golang.org/genproto v0.0.0-20210602131652-f16073e35f0c
	google.golang.org/grpc v1.38.0
	google.golang.org/protobuf v1.26.0
	gopkg.in/yaml.v2 v2.4.0
	k8s.io/api v0.21.9
	k8s.io/apiextensions-apiserver v0.21.9
	k8s.io/apimachinery v0.21.9
	k8s.io/cli-runtime v0.21.9
	k8s.io/client-go v0.21.9
	k8s.io/code-generator v0.21.9
	k8s.io/klog/v2 v2.10.0
	k8s.io/kube-openapi v0.0.0-20211110012726-3cc51fd1e909
	k8s.io/kubectl v0.21.9
	k8s.io/kubernetes v1.21.9
	k8s.io/metrics v0.21.9
	sigs.k8s.io/controller-runtime v0.9.7
	sigs.k8s.io/controller-tools v0.6.2
	sigs.k8s.io/gateway-api v0.2.0
	sigs.k8s.io/yaml v1.3.0
)

require (
	cloud.google.com/go v0.81.0 // indirect
	github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78 // indirect
	github.com/Azure/go-autorest v14.2.0+incompatible // indirect
	github.com/Azure/go-autorest/autorest v0.11.12 // indirect
	github.com/Azure/go-autorest/autorest/adal v0.9.5 // indirect
	github.com/Azure/go-autorest/autorest/date v0.3.0 // indirect
	github.com/Azure/go-autorest/logger v0.2.0 // indirect
	github.com/Azure/go-autorest/tracing v0.6.0 // indirect
	github.com/MakeNowJust/heredoc v0.0.0-20170808103936-bb23615498cd // indirect
	github.com/Masterminds/goutils v1.1.0 // indirect
	github.com/Masterminds/semver v1.5.0 // indirect
	github.com/PuerkitoBio/purell v1.1.1 // indirect
	github.com/PuerkitoBio/urlesc v0.0.0-20170810143723-de5bf2ad4578 // indirect
	github.com/armon/go-metrics v0.0.0-20180917152333-f0300d1749da // indirect
	github.com/asaskevich/govalidator v0.0.0-20200428143746-21a406dcc535 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/docker/distribution v2.7.1+incompatible // indirect
	github.com/emicklei/go-restful v2.9.5+incompatible // indirect
	github.com/evanphx/json-patch v4.11.0+incompatible // indirect
	github.com/exponent-io/jsonpath v0.0.0-20151013193312-d6023ce2651d // indirect
	github.com/fatih/camelcase v1.0.0 // indirect
	github.com/fatih/color v1.12.0 // indirect
	github.com/form3tech-oss/jwt-go v3.2.2+incompatible // indirect
	github.com/ghodss/yaml v1.0.1-0.20190212211648-25d852aebe32 // indirect
	github.com/go-errors/errors v1.0.1 // indirect
	github.com/go-logr/logr v0.4.0 // indirect
	github.com/go-openapi/jsonpointer v0.19.5 // indirect
	github.com/go-openapi/jsonreference v0.19.3 // indirect
	github.com/go-openapi/spec v0.19.5 // indirect
	github.com/go-openapi/swag v0.19.5 // indirect
	github.com/gobuffalo/flect v0.2.3 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/google/btree v1.0.0 // indirect
	github.com/google/gofuzz v1.1.0 // indirect
	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510 // indirect
	github.com/googleapis/gnostic v0.5.5 // indirect
	github.com/gregjones/httpcache v0.0.0-20190611155906-901d90724c79 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.1 // indirect
	github.com/hashicorp/go-immutable-radix v1.0.0 // indirect
	github.com/hashicorp/go-rootcerts v1.0.0 // indirect
	github.com/hashicorp/golang-lru v0.5.4 // indirect
	github.com/hashicorp/serf v0.8.2 // indirect
	github.com/huandu/xstrings v1.3.2 // indirect
	github.com/imdario/mergo v0.3.12 // indirect
	github.com/inconshreveable/mousetrap v1.0.0 // indirect
	github.com/josharian/intern v1.0.1-0.20211109044230-42b52b674af5 // indirect
	github.com/json-iterator/go v1.1.11 // indirect
	github.com/liggitt/tabwriter v0.0.0-20181228230101-89fcab3d43de // indirect
	github.com/mailru/easyjson v0.7.0 // indirect
	github.com/mattn/go-colorable v0.1.8 // indirect
	github.com/mattn/go-isatty v0.0.12 // indirect
	github.com/mitchellh/copystructure v1.0.0 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/mitchellh/go-wordwrap v1.0.0 // indirect
	github.com/mitchellh/mapstructure v1.4.1 // indirect
	github.com/mitchellh/reflectwalk v1.0.1 // indirect
	github.com/moby/spdystream v0.2.0 // indirect
	github.com/moby/term v0.0.0-20201216013528-df9cb8a40635 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.1 // indirect
	github.com/monochromegane/go-gitignore v0.0.0-20200626010858-205db1a8cc00 // indirect
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/peterbourgon/diskv v2.0.1+incompatible // indirect
	github.com/russross/blackfriday v1.5.2 // indirect
	github.com/xlab/treeprint v0.0.0-20181112141820-a009c3971eca // indirect
	go.starlark.net v0.0.0-20200306205701-8dd3e2ee1dd5 // indirect
	golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83 // indirect
	golang.org/x/net v0.0.0-20211209124913-491a49abca63 // indirect
	golang.org/x/oauth2 v0.0.0-20210402161424-2e8d93401602 // indirect
	golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d // indirect
	golang.org/x/text v0.3.6 // indirect
	golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac // indirect
	golang.org/x/tools v0.1.5 // indirect
	golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1 // indirect
	google.golang.org/appengine v1.6.7 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b // indirect
	k8s.io/apiserver v0.21.9 // indirect
	k8s.io/component-base v0.21.9 // indirect
	k8s.io/gengo v0.0.0-20201214224949-b6c5ce23f027 // indirect
	k8s.io/utils v0.0.0-20210802155522-efc7438f0176 // indirect
	sigs.k8s.io/kustomize/api v0.8.8 // indirect
	sigs.k8s.io/kustomize/kyaml v0.10.17 // indirect
	sigs.k8s.io/structured-merge-diff/v4 v4.2.1 // indirect
)
