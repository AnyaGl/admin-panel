const rabbit = require("../../../../rabbit"); 

function createProductJson(data) {
  const productData = {
    id: data.id,
    name: data.name,
    createdAt: data.createdAt,
    updatedAt: data.updatedAt,
    tariffs: data.tariffs
  }
  const product = strapi.service('api::product.product').convertProduct(productData);
  
  return {
    product: product
  };
}

function getWidjetCode(id) {
  return `<div class="saas_shop_tariffs" data-product_id="${id}"></div>
<script>
  saas_shop_create_tariffs(${id});
</script>`
}

module.exports = {

  async afterCreate(event) {
    const product = createProductJson(event.result);
    const broker = await rabbit.getInstance();
    await broker.send('product_service:product.created', Buffer.from(JSON.stringify(product)));
    needSendUpdateMsg = false;
    await strapi.query('api::product.product').update({where: {id: product.product.id}, data: {widjet: getWidjetCode(product.product.id)}});

  },

  async afterUpdate(event) {
    if (needSendUpdateMsg)
    {
      const product = createProductJson(event.result);
      const broker = await rabbit.getInstance();
      await broker.send('product_service:product.updated', Buffer.from(JSON.stringify(product)));
    }
    needSendUpdateMsg = true;
  }, 

  async afterDelete(event) {
    const productId = {
      product_id: event.params.where.id
    };
    const broker = await rabbit.getInstance();
    await broker.send('product_service:product.deleted', Buffer.from(JSON.stringify(productId)));
  },
};