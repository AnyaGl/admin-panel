'use strict';
const merge = require('deepmerge-json');

/**
 *  product controller
 */


 const DATABASE_SCHEMA = process.env.DATABASE_SCHEMA

const { createCoreController } = require('@strapi/strapi').factories;

function createProductJson(data) {
    const productData = {
      id: data.id,
      name: data.attributes.name,
      createdAt: data.attributes.createdAt,
      updatedAt: data.attributes.updatedAt,
      tariffs: data.attributes.tariffs,
      ops_json: data.attributes.ops_json
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
        var tariff = await strapi.db.connection.raw(`SELECT * FROM ${DATABASE_SCHEMA}.components_product_info_tariffs WHERE id = ${id}`)
        .then(r => {
            return r.rows[0];
        });
        if (!tariff)
        {
            return {error: "Тариф не найден"};
        }

        await strapi.db.connection.raw(`SELECT t1.*
            FROM ${DATABASE_SCHEMA}.components_product_info_tariff_variants AS t1
            LEFT JOIN ${DATABASE_SCHEMA}.components_product_info_tariffs_components AS t2
            ON t2.component_id = t1.id
            WHERE t2.entity_id = ${id}`)
        .then (r => {
            tariff.tariff_variants = r.rows;
        });

        return strapi.db.connection.raw(`SELECT t1.entity_id, t2.ops_json AS product_json
            FROM ${DATABASE_SCHEMA}.products_components AS t1
            INNER JOIN ${DATABASE_SCHEMA}.products AS t2
            ON t1.entity_id = t2.id
            WHERE t1.component_id = ${id}`)
        .then (r => {
            return strapi.service('api::product.product').convertTariff(tariff, r.rows[0].entity_id, r.rows[0].product_json);
        });

    },

    async findTariffVariant(ctx) {
        const id = ctx.params.id;
        var tariffVariant = await strapi.db.connection.raw(`SELECT * FROM ${DATABASE_SCHEMA}.components_product_info_tariff_variants WHERE id = ${id}`)
        .then(r => {
            return r.rows[0];
        });
        if (!tariffVariant)
        {
            return {error: "Вариант тарифа не найден"};
        }

        return strapi.db.connection.raw(`SELECT t1.unit_price, t1.id, t1.ops_json AS tariff_json, t4.ops_json AS product_json
            FROM ${DATABASE_SCHEMA}.components_product_info_tariffs AS t1
            INNER JOIN ${DATABASE_SCHEMA}.components_product_info_tariffs_components AS t2
            ON t2.entity_id = t1.id
            INNER JOIN ${DATABASE_SCHEMA}.products_components AS t3
            ON t1.id = t3.component_id
            INNER JOIN ${DATABASE_SCHEMA}.products AS t4
            ON t4.id = t3.entity_id
            WHERE t2.component_id = ${id}`)
        .then (r => {
            const json = merge(r.rows[0].product_json, r.rows[0].tariff_json);
            return strapi.service('api::product.product').convertTariffVariant(r.rows[0].unit_price, tariffVariant, r.rows[0].id, json);
        }, error => {
            return error;
        });
    }
}));
