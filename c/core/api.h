// BluefinShieldconexMgmt SDK public API (generated).

#ifndef BLUEFIN_SHIELDCONEX_MGMT_API_H
#define BLUEFIN_SHIELDCONEX_MGMT_API_H

#include "sdk.h"

// Client entity.
Entity* client_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefin_shieldconex_mgmt_client(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* client_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Clone entity.
Entity* clone_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefin_shieldconex_mgmt_clone(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* clone_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Partner entity.
Entity* partner_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefin_shieldconex_mgmt_partner(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* partner_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Template entity.
Entity* template_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefin_shieldconex_mgmt_template(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* template_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Transaction entity.
Entity* transaction_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefin_shieldconex_mgmt_transaction(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* transaction_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// UpdateResult entity.
Entity* update_result_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefin_shieldconex_mgmt_update_result(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* update_result_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// User entity.
Entity* user_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefin_shieldconex_mgmt_user(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* user_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);

#endif // BLUEFIN_SHIELDCONEX_MGMT_API_H
