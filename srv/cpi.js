const cds = require('@sap/cds');

module.exports = async function cpi() {
    console.log('*************************************************');
    const cpie = await cds.connect.to('CPIDestination');
    console.log('*************************************************');
    await cpie.tx(req).post('/http/orderFlow', {"price": 15, "copyQty": 3});
    console.log('*************************************************');
    // await UPDATE(Books, { bookUUID: bookUUID }).with({ status_ID: "1" });
    console.log('*************************************************');
    
};