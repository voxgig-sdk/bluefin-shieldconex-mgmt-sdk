# BluefinShieldconexMgmt SDK feature factory

from feature.base_feature import BluefinShieldconexMgmtBaseFeature
from feature.test_feature import BluefinShieldconexMgmtTestFeature


def _make_feature(name):
    features = {
        "base": lambda: BluefinShieldconexMgmtBaseFeature(),
        "test": lambda: BluefinShieldconexMgmtTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
