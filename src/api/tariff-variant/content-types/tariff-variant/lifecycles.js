const rabbit = require("../../../../rabbit"); 

module.exports = {   
  async afterCreate(event) {
    const { result, params } = event;                                    	

    const broker = await rabbit.getInstance();
    await broker.send('product_service:tariff_variant.created', Buffer.from(result['id'].toString()));
  },

  async afterUpdate(event) {
    const { result, params } = event;                                    	

    const broker = await rabbit.getInstance();
    await broker.send('product_service:tariff_variant.updated', Buffer.from(result['id'].toString()));
  },

  async afterDelete(event) {
    const { result, params } = event;                                    	

    const broker = await rabbit.getInstance();
    await broker.send('product_service:tariff_variant.deleted', Buffer.from(JSON.stringify(result)));
  },
};