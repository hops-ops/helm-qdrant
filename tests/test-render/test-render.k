import models.io.crossplane.apiextensions.v1 as crossplane
import models.v1alpha1 as v1alpha1
import file
import yaml

_oxr_minimal = yaml.decode(file.read("observed-xr-minimal.yaml"))
_oxr_standard = yaml.decode(file.read("observed-xr-standard.yaml"))

test_minimal_render = crossplane.CompositionTest {
    apiVersion = "apiextensions.crossplane.io/v1alpha1"
    kind = "CompositionTest"
    metadata.name = "test-minimal"
    spec = {
        composition.path = "../../apis/qdrants/composition.yaml"
        xrd.path = "../../apis/qdrants/definition.yaml"
        observedResources = {
            xr = _oxr_minimal
        }
        assertResources = [
            {
                name = "helm-release"
                resource.metadata.name = "qdrant-helm-release"
            }
        ]
    }
}

test_standard_render = crossplane.CompositionTest {
    apiVersion = "apiextensions.crossplane.io/v1alpha1"
    kind = "CompositionTest"
    metadata.name = "test-standard"
    spec = {
        composition.path = "../../apis/qdrants/composition.yaml"
        xrd.path = "../../apis/qdrants/definition.yaml"
        observedResources = {
            xr = _oxr_standard
        }
        assertResources = [
            {
                name = "helm-release"
                resource.metadata.name = "qdrant-helm-release"
            }
        ]
    }
}
