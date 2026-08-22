import { BluefinShieldconexMgmtEntityBase } from '../BluefinShieldconexMgmtEntityBase';
import type { BluefinShieldconexMgmtSDK } from '../BluefinShieldconexMgmtSDK';
import type { Control } from '../types';
import type { Template, TemplateLoadMatch, TemplateListMatch, TemplateCreateData, TemplateRemoveMatch } from '../BluefinShieldconexMgmtTypes';
declare class TemplateEntity extends BluefinShieldconexMgmtEntityBase<Template> {
    constructor(client: BluefinShieldconexMgmtSDK, entopts: any);
    make(this: TemplateEntity): TemplateEntity;
    load(this: any, reqmatch?: TemplateLoadMatch, ctrl?: Control): Promise<TemplateEntity>;
    list(this: any, reqmatch?: TemplateListMatch, ctrl?: Control): Promise<TemplateEntity[]>;
    create(this: any, reqdata?: TemplateCreateData, ctrl?: Control): Promise<TemplateEntity>;
    remove(this: any, reqmatch?: TemplateRemoveMatch, ctrl?: Control): Promise<TemplateEntity>;
}
export { TemplateEntity };
