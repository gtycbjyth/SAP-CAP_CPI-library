const cds = require('@sap/cds');
const  { cpi, orderDataForCPI }  = require('./assets/cpi');


module.exports = cds.service.impl(function () {
    const { SELECT, UPDATE, INSERT } = cds.ql
    this.on('orderBook', async (req) => {
        const [{ ID }] = req.params
        const order = await SELECT.one.from('BookOrder').where({ ID: ID });
        const book = await SELECT.one.from('Library').where({ ID: order.book_ID });
        const author = await SELECT.one.from('Authors').where({ ID: book.author_ID });
        const cpiReqData = orderDataForCPI(req, order, book, author);
        
        // console.log(cpiReqData);
        
        const cpiResponse = await cpi(req, cpiReqData);
        
        // console.log(cpiResponse);

        // await cpie.tx(req).post('/http/orderFlow');
        // const query = cds.parse.cql(`SELECT * FROM BookOrder WHERE ID='${ID}'`);
        // const order = await cds.run (query);
        // const query = cds.parse.cql(`SELECT * FROM BookOrder WHERE ID='${ID}'`);
        // const setOrderQti = cds.parse.cql(`UPDATE BookOrder SET orderQti = '${req.data.orderProp}' WHERE ID='${ID}'`);
        //  const test = await UPDATE (BookOrder, {ID:ID}) .with({orderQti: req.data.orderProp});
        const bookOrder = await UPDATE`BookOrder`
            .set`orderQti = ${req.data.orderProp}`
            .set`LocalCurrencyCode = ${cpiResponse.LocalCurrencyCode_code}`
            .set`totalPrice = ${cpiResponse.totalPrice}`
            .set`totalLocal = ${cpiResponse.totalPrice}`
            .set`status = 'Requested'`
            .where`ID=${ID}`;
        // await cpi();
    })
    this.before('CREATE', 'BookOrder', async req => {
        const query = cds.parse.cql(`SELECT MAX(orderCount) FROM BookOrder`);
        const count = await cds.run(query);
        req.data.status = 'Open';
        req.data.orderCount = count[0]['MAX(ORDERCOUNT)'] + 1;

    })
})

// module.exports = async function () {
//     console.log('*/*/*/**/*/*/*/*/*//*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*//**');
//     const db = await cds.connect.to('db')
//     const { BookOrder } = db.entities;
//     console.log(BookOrder);

//     let orderCount = 1;
//     //TODO add sql BookOrder SELECT MAX(orderCount)
//     // srv.before()
//     this.before('CREATE', 'BookOrder', req => {
//         orderCount += 1;
//         req.data.orderCount = orderCount;
//         console.log('*/*/*/**/*/*/*/*/*//*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*//**');
//         })
// }
// module.exports = srv => {
//     // srv.after('READ', 'Books', data => {
//     //     const newData = [];

//     //     data.forEach(el => {
//     //         el.title = "Title chenged!!!"
//     //         // newData.push(el); 
//     //     });

//     //     // data = newData;
//     // });
// console.log('*/*/*/**/*/*/*/*/*//*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*//**');
// srv.before('CREATE', 'BookOrder', req => {
//     orderCount += 1;
//     req.data.orderCount = orderCount;
//     })
// }