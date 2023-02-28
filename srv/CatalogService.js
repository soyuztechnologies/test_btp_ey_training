const cds = require('@sap/cds');
module.exports = cds.service.impl(
    async function () { 
        //handling of sleep
        this.on('sleep', async () => {
            try {
                const db = await cds.connect.to('db');
                const dbClass = require('sap-hdbext-promisfied');
                let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials));
                const hdbext = require('@sap/hdbext');
                const sp = await dbConn.loadProcedurePromisified(hdbext,null,'sleep');
                const output = await dbConn.callProcedurePromisified(sp,[]);
                console.log(output);
                return true;
            } catch (error) {
                console.log(error);
                return false;
            }
        });

        //add generic handler for employee update
        const {
            EmployeeSet, POs
        } = this.entities;
    
        this.before('UPDATE', EmployeeSet, (req,res) => {
            console.log("aaya kya", req.data.salaryAmount);
            if(parseFloat(req.data.salaryAmount) >= 1000000){
                req.error(500, "salary must be below 1 mn");
                //res.send("Dude, not allowed salary");
            }
        });
    }
);