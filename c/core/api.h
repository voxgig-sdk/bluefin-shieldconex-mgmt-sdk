// BluefinShieldconexMgmt SDK public API (generated).

#ifndef BLUEFINSHIELDCONEXMGMT_API_H
#define BLUEFINSHIELDCONEXMGMT_API_H

#include "sdk.h"

// Client entity.
Entity* client_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefinshieldconexmgmt_client(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* client_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Clone entity.
Entity* clone_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefinshieldconexmgmt_clone(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* clone_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Partner entity.
Entity* partner_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefinshieldconexmgmt_partner(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* partner_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Template entity.
Entity* template_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefinshieldconexmgmt_template(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* template_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Transaction entity.
Entity* transaction_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefinshieldconexmgmt_transaction(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* transaction_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// UpdateResult entity.
Entity* update_result_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefinshieldconexmgmt_update_result(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* update_result_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// User entity.
Entity* user_entity_new(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
Entity* bluefinshieldconexmgmt_user(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts);
voxgig_value* user_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);

#endif // BLUEFINSHIELDCONEXMGMT_API_H
