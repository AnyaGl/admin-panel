'use strict';                                          

/**
 *  product controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

function createProductJson(data) {
    const productData = {
      id: data.id,
      name: data.attributes.name,
      createdAt: data.attributes.createdAt,
      updatedAt: data.attributes.updatedAt,
      tariffs: data.attributes.tariffs
    }
    return strapi.service('api::product.product').convertProduct(productData);
}

module.exports = createCoreController('api::product.product', ({strapi}) => ({
    async find(ctx) {
        const { data, meta } = await super.find(ctx);    
        return data.map(createProductJson);
    },

    async findOne(ctx) {
        const result = await super.findOne(ctx);
        if (!result)
        {
            return {error: "Продукт не найден"};
        }
        return createProductJson(result.data);
    },

    async findTariff(ctx) {
        const id = ctx.params.id;
        var tariff = await strapi.db.connection.raw(`SELECT * FROM components_product_info_tariffs WHERE id = ${id}`)
        .then(r => {
            return r.rows[0];
        });
        if (!tariff)
        {
            return {error: "Тариф не найден"};
        }
        
        await strapi.db.connection.raw(`SELECT t1.* 
            FROM components_product_info_tariff_variants AS t1
            LEFT JOIN components_product_info_tariffs_components AS t2
            ON t2.component_id = t1.id
            WHERE t2.entity_id = ${id}`)
        .then (r => {
            tariff.tariff_variants = r.rows;
        });

        return strapi.db.connection.raw(`SELECT t1.entity_id 
            FROM products_components AS t1
            WHERE t1.component_id = ${id}`)
        .then (r => {
            return strapi.service('api::product.product').convertTariff(tariff, r.rows[0].entity_id); 
        });
        
    },    

    async findTariffVariant(ctx) {
        const id = ctx.params.id;
        var tariffVariant = await strapi.db.connection.raw(`SELECT * FROM components_product_info_tariff_variants WHERE id = ${id}`)
        .then(r => {
            return r.rows[0];
        });
        if (!tariffVariant)
        {
            return {error: "Вариант тарифа не найден"};
        }
        
        return strapi.db.connection.raw(`SELECT t1.unit_price, t1.id 
            FROM components_product_info_tariffs AS t1
            LEFT JOIN components_product_info_tariffs_components AS t2
            ON t2.entity_id = t1.id
            WHERE t2.component_id = ${id}`)
        .then (r => {
            return strapi.service('api::product.product').convertTariffVariant(r.rows[0].unit_price, tariffVariant, r.rows[0].id); 
        }, error => { 
            return error; 
        });
    }
}));
