const cds = require('@sap/cds');


//TODO: add error heandler for async code
//TODO: think about transaction: ask Vera

 const cpi = async function (req, reqData) {
    const cpi = await cds.connect.to('CPIDestination');
    const res = await await cpi.tx(req).post('/http/orderFlow', reqData)
    console.log('*************************************************');
    // await UPDATE(Books, { bookUUID: bookUUID }).with({ status_ID: "1" });
    return res
};

const orderDataForCPI =  function (req, order, book, author) {
    const totalPrice = req.data.orderProp * book.price;

    return {
        "orderUUID": order.ID,
        "bookUUID": book.ID,
        "authorUUID": author.ID,
        "authorfirstName": author.firstName,
        "authorlastName": author.lastName,
        "bookName": book.title,
        "price": book.price,
        "quantity": req.data.orderProp,
        "LocalCurrencyCode_code": order.localCurrency_code,
        "CurrencyCode_code": book.currency_code,
        "status_ID": order.status,
        "totalPrice": totalPrice
    }
};

module.exports = { cpi, orderDataForCPI }

// const tumb = {
//     "WorkflowDetails": {
//         "title": "Book(s) in order",
//         "comment": "Please Approve"
//     },
//     "BookOrder": {
//         "orderUUID": "0640bc67-f03d-4a85-ae9f-ebb99b4e5520",
//         "bookName": "Harry",
//         "authorfirstName": "Richard",
//         "authorlastName": "Carpenter",
//         "CurrencyCode_code": "EUR",
//         "LocalCurrencyCode_code": "BYN",
//         "price": 160,
//         "quantity": 10,
//         "status_ID": "1",
//         "totalPrice": 1600,
//         "totalLocal": 4000
//     }
// }
