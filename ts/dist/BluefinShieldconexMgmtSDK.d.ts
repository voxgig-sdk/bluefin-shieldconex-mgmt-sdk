import { ClientEntity } from './entity/ClientEntity';
import { CloneEntity } from './entity/CloneEntity';
import { PartnerEntity } from './entity/PartnerEntity';
import { TemplateEntity } from './entity/TemplateEntity';
import { TransactionEntity } from './entity/TransactionEntity';
import { UpdateResultEntity } from './entity/UpdateResultEntity';
import { UserEntity } from './entity/UserEntity';
export type * from './BluefinShieldconexMgmtTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { BluefinShieldconexMgmtEntityBase } from './BluefinShieldconexMgmtEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class BluefinShieldconexMgmtSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Client(entopts?: Record<string, any>): ClientEntity;
    Clone(entopts?: Record<string, any>): CloneEntity;
    Partner(entopts?: Record<string, any>): PartnerEntity;
    Template(entopts?: Record<string, any>): TemplateEntity;
    Transaction(entopts?: Record<string, any>): TransactionEntity;
    UpdateResult(entopts?: Record<string, any>): UpdateResultEntity;
    User(entopts?: Record<string, any>): UserEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): BluefinShieldconexMgmtSDK;
    tester(testopts?: any, sdkopts?: any): BluefinShieldconexMgmtSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof BluefinShieldconexMgmtSDK;
export { stdutil, config, BaseFeature, BluefinShieldconexMgmtEntityBase, BluefinShieldconexMgmtSDK, SDK, };
