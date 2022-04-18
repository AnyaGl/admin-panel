const rabbit = require("../../../../rabbit"); 

function createProductJson(data) {
  const productData = {
    id: data.id,
    name: data.name,
    createdAt: data.createdAt,
    updatedAt: data.updatedAt,
    tariffs: data.tariffs,
    ops_json: data.ops_json
  }
  const product = strapi.service('api::product.product').convertProduct(productData);
  
  return {
    product: product
  };
}

function getWidgetCode(id) {
  return `<div class="saas_shop_tariffs" data-product_id="${id}"></div>
<script>
  widgetSaasShop.init(${id});
</script>`
}

var needSendUpdateMsg = true;

module.exports = {

  async afterCreate(event) {
    const product = createProductJson(event.result);
    const broker = await rabbit.getInstance();
    broker && broker.send('product_service:product.created', product);    
    needSendUpdateMsg = false;
    strapi.query('api::product.product').update({where: {id: product.product.id}, data: {widget: getWidgetCode(product.product.id)}});
  },

  async afterUpdate(event) {
    if (needSendUpdateMsg)
    {
      const product = createProductJson(event.result);
      const broker = await rabbit.getInstance();
      broker && broker.send('product_service:product.updated', product);
    }
    needSendUpdateMsg = true;
  }, 

  async afterDelete(event) {
    const productId = {
      product_id: event.params.where.id
    };
    const broker = await rabbit.getInstance();
    broker && broker.send('product_service:product.deleted', productId);
  },
};