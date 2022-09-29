const cds = require('@sap/cds');
const  { cpi, orderDataForCPI }  = require('./assets/cpi');


module.exports = cds.service.impl(function () {
    const { SELECT, UPDATE } = cds.ql;

    this.on('orderBook', async (req) => {
        try {
            const [{ ID }] = req.params
        const order = await SELECT.one.from('BookOrder').where({ ID: ID });
        const book = await SELECT.one.from('Library').where({ ID: order.book_ID });
        const author = await SELECT.one.from('Authors').where({ ID: book.author_ID });
        const cpiReqData = orderDataForCPI(req, order, book, author);
        
        const cpiResponse = await cpi(req, cpiReqData);

        await UPDATE`BookOrder`
            .set`orderQti = ${req.data.orderProp}`
            .set`LocalCurrencyCode = ${cpiResponse.LocalCurrencyCode_code}`
            .set`totalPrice = ${cpiResponse.totalPrice}`
            .set`totalLocal = ${cpiResponse.totalPrice}`
            .set`status = 'Requested'`
            .where`ID=${ID}`;
        } catch (error) {
            console.log(error);
        }
        
    })

    this.before('CREATE', 'BookOrder', async req => {
        try {
        const query = cds.parse.cql(`SELECT MAX(orderCount) FROM BookOrder`);
        const count = await cds.run(query);
        req.data.status = 'Open';
        req.data.orderCount = count[0]['MAX(ORDERCOUNT)'] + 1;

        } catch (error) {
            console.log(error);
        }

    });
})

