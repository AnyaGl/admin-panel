const rabbit = require("../../../../rabbit"); 

function createProductJson(data) {
  return {
    product: {
      id: data.id,
      name: data.name,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      tariffs: data.tariffs
    }
  };
}

module.exports = { 
  async afterCreate(event) {
    const product = createProductJson(event.result);
    const broker = await rabbit.getInstance();
    await broker.send('product_service:product.created', Buffer.from(JSON.stringify(product)));
  },

  async afterUpdate(event) {
    const product = createProductJson(event.result);
    const broker = await rabbit.getInstance();
    await broker.send('product_service:product.updated', Buffer.from(JSON.stringify(product)));
  }, 

  async afterDelete(event) {
    const productId = {
      product_id: event.params.where.id
    };
    const broker = await rabbit.getInstance();
    await broker.send('product_service:product.deleted', Buffer.from(JSON.stringify(productId)));
  },
};