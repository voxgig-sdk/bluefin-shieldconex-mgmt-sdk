import { BluefinShieldconexMgmtEntityBase } from '../BluefinShieldconexMgmtEntityBase';
import type { BluefinShieldconexMgmtSDK } from '../BluefinShieldconexMgmtSDK';
import type { Control } from '../types';
import type { Client, ClientLoadMatch, ClientListMatch, ClientCreateData, ClientRemoveMatch } from '../BluefinShieldconexMgmtTypes';
declare class ClientEntity extends BluefinShieldconexMgmtEntityBase<Client> {
    constructor(client: BluefinShieldconexMgmtSDK, entopts: any);
    make(this: ClientEntity): ClientEntity;
    load(this: any, reqmatch?: ClientLoadMatch, ctrl?: Control): Promise<ClientEntity>;
    list(this: any, reqmatch?: ClientListMatch, ctrl?: Control): Promise<ClientEntity[]>;
    create(this: any, reqdata?: ClientCreateData, ctrl?: Control): Promise<ClientEntity>;
    remove(this: any, reqmatch?: ClientRemoveMatch, ctrl?: Control): Promise<ClientEntity>;
}
export { ClientEntity };
