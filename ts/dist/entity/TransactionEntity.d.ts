import { BluefinShieldconexMgmtEntityBase } from '../BluefinShieldconexMgmtEntityBase';
import type { BluefinShieldconexMgmtSDK } from '../BluefinShieldconexMgmtSDK';
import type { Control } from '../types';
import type { Transaction, TransactionLoadMatch, TransactionListMatch } from '../BluefinShieldconexMgmtTypes';
declare class TransactionEntity extends BluefinShieldconexMgmtEntityBase<Transaction> {
    constructor(client: BluefinShieldconexMgmtSDK, entopts: any);
    make(this: TransactionEntity): TransactionEntity;
    load(this: any, reqmatch?: TransactionLoadMatch, ctrl?: Control): Promise<TransactionEntity>;
    list(this: any, reqmatch?: TransactionListMatch, ctrl?: Control): Promise<TransactionEntity[]>;
}
export { TransactionEntity };
