import { BluefinShieldconexMgmtEntityBase } from '../BluefinShieldconexMgmtEntityBase';
import type { BluefinShieldconexMgmtSDK } from '../BluefinShieldconexMgmtSDK';
import type { Control } from '../types';
import type { User, UserLoadMatch } from '../BluefinShieldconexMgmtTypes';
declare class UserEntity extends BluefinShieldconexMgmtEntityBase<User> {
    constructor(client: BluefinShieldconexMgmtSDK, entopts: any);
    make(this: UserEntity): UserEntity;
    load(this: any, reqmatch?: UserLoadMatch, ctrl?: Control): Promise<UserEntity>;
}
export { UserEntity };
