const cds = require('@sap/cds');

class TechnicalService extends cds.ApplicationService {
    async init() {
        this.before('UPDATE', 'BookOrder', async (req) => {
            try {
                const { SELECT, UPDATE } = cds.ql;
                const { Library, BookOrder } = cds.entities;
                const [ID] = req.params
                const { status } = req.data;

                const { book_ID, orderQti } = await SELECT.one.from(BookOrder).where({ ID: ID })

                if (status === "Approved") {
                    const { copyQty } = await SELECT.one.from(Library).where({ ID: book_ID });
                    const increment = orderQti + copyQty;

                    await UPDATE(Library, { ID: book_ID }).with({ copyQty: increment })
                }
            } catch (error) {
                console.log(error);
            }
        })
        await super.init()
    }
}

module.exports = { TechnicalService };
