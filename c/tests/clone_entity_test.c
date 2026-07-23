// Generated instance test for the clone entity.

#include "ctest.h"

int main(void) {
  BluefinShieldconexMgmtSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefinshieldconexmgmt_clone(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "clone", "entity get_name");

  TEST_SUMMARY("clone_entity");
}
