import { BluefinShieldconexMgmtEntityBase } from '../BluefinShieldconexMgmtEntityBase';
import type { BluefinShieldconexMgmtSDK } from '../BluefinShieldconexMgmtSDK';
import type { Control } from '../types';
import type { UpdateResult, UpdateResultListMatch, UpdateResultCreateData, UpdateResultUpdateData } from '../BluefinShieldconexMgmtTypes';
declare class UpdateResultEntity extends BluefinShieldconexMgmtEntityBase<UpdateResult> {
    constructor(client: BluefinShieldconexMgmtSDK, entopts: any);
    make(this: UpdateResultEntity): UpdateResultEntity;
    list(this: any, reqmatch?: UpdateResultListMatch, ctrl?: Control): Promise<UpdateResultEntity[]>;
    create(this: any, reqdata?: UpdateResultCreateData, ctrl?: Control): Promise<UpdateResultEntity>;
    update(this: any, reqdata?: UpdateResultUpdateData, ctrl?: Control): Promise<UpdateResultEntity>;
}
export { UpdateResultEntity };
