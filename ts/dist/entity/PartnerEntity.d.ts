import { BluefinShieldconexMgmtEntityBase } from '../BluefinShieldconexMgmtEntityBase';
import type { BluefinShieldconexMgmtSDK } from '../BluefinShieldconexMgmtSDK';
import type { Control } from '../types';
import type { Partner, PartnerLoadMatch, PartnerListMatch, PartnerCreateData } from '../BluefinShieldconexMgmtTypes';
declare class PartnerEntity extends BluefinShieldconexMgmtEntityBase<Partner> {
    constructor(client: BluefinShieldconexMgmtSDK, entopts: any);
    make(this: PartnerEntity): PartnerEntity;
    load(this: any, reqmatch?: PartnerLoadMatch, ctrl?: Control): Promise<PartnerEntity>;
    list(this: any, reqmatch?: PartnerListMatch, ctrl?: Control): Promise<PartnerEntity[]>;
    create(this: any, reqdata?: PartnerCreateData, ctrl?: Control): Promise<PartnerEntity>;
}
export { PartnerEntity };
