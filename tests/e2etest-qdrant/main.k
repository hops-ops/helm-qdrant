import models.io.crossplane.apiextensions.v1 as crossplane
import models.v1alpha1 as v1alpha1
import file
import yaml

_claim = yaml.decode(file.read("claim.yaml"))

test_e2e_qdrant = crossplane.E2ETest {
    apiVersion = "apiextensions.crossplane.io/v1alpha1"
    kind = "E2ETest"
    metadata.name = "e2etest-qdrant"
    spec = {
        xrd.path = "../../apis/qdrants/definition.yaml"
        composition.path = "../../apis/qdrants/composition.yaml"
        resources = [_claim]
        timeout = "10m"
    }
}
