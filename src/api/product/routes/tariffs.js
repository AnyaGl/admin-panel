module.exports = {
  routes: [
    {
      method: 'GET',
      path: '/tariff/:id',
      handler: 'product.findTariff'
    },
    {
      method: 'GET',
      path: '/tariff_variant/:id',
      handler: 'product.findTariffVariant'
    },
  ],
};