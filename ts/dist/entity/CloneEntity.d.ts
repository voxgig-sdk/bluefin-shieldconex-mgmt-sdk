import { BluefinShieldconexMgmtEntityBase } from '../BluefinShieldconexMgmtEntityBase';
import type { BluefinShieldconexMgmtSDK } from '../BluefinShieldconexMgmtSDK';
import type { Control } from '../types';
import type { Clone, CloneCreateData } from '../BluefinShieldconexMgmtTypes';
declare class CloneEntity extends BluefinShieldconexMgmtEntityBase<Clone> {
    constructor(client: BluefinShieldconexMgmtSDK, entopts: any);
    make(this: CloneEntity): CloneEntity;
    create(this: any, reqdata?: CloneCreateData, ctrl?: Control): Promise<CloneEntity>;
}
export { CloneEntity };
