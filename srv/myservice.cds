using { anubhav.db.master, anubhav.db.transaction  } from '../db/datamodel';

service mysrvdemo {

    function somesrv(msg: String) returns String;

    entity ReadEmoployeeSrv as projection on master.employees;

    entity InsertEmployeeSrv as projection on master.employees;

    entity UpdateEmployeeSrv as projection on master.employees;

    entity DeleteEmployeeSrv as projection on master.employees;

}