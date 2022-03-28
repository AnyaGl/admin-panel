const rabbit = require("../../../../rabbit"); 

module.exports = {   
  async afterCreate(event) {
    const { result, params } = event;                                    	

    const broker = await rabbit.getInstance();
    await broker.send('product_service:product.created', Buffer.from(result['id'].toString()));
  },

  async afterUpdate(event) {
    const { result, params } = event;                                    	

    const broker = await rabbit.getInstance();
    await broker.send('product_service:product.updated', Buffer.from(result['id'].toString()));
  }, 

  async afterDelete(event) {
    const { result, params } = event;                                    	

    const broker = await rabbit.getInstance();
    await broker.send('product_service:product.deleted', Buffer.from(JSON.stringify(event.params.where)));
  },
};