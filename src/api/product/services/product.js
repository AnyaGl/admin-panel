'use strict';
const merge = require('deepmerge-json');
/**
 * product service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

function convertPeriod(period) {
    if (period == "month")
    {
        return 30;
    }
    if (period == "year")
    {
        return 360;
    }
    return 0;
}

function createDisplayName(period) {
    if (period == "month")
    {
        return "1 месяц";
    }
    if (period == "year")
    {
        return "1 год";
    }
    return "";
}

function calculatePrice(unitPrice, period) {
    if (period == "month")
    {
        return unitPrice;
    }
    if (period == "year")
    {
        return 12 * unitPrice;
    }
    return 0;
}

function convertTariffVariantImpl(unitPrice, source, tariffId, baseJson) {
    const tariffVariant = {};
    tariffVariant.id = source.id;
    tariffVariant.tariff_id = tariffId;
    tariffVariant.ops_json = merge(baseJson, source.ops_json);
    tariffVariant.period = convertPeriod(source.period);
    tariffVariant.discount = source.discount;
    tariffVariant.display_name = createDisplayName(source.period);
    tariffVariant.price = calculatePrice(unitPrice, source.period);
    tariffVariant.total_price = tariffVariant.price * (100 - tariffVariant.discount) / 100;
    return tariffVariant;
}

function convertTariffVariants(unitPrice, tariffVariants, tariffId, baseJson) {
    return tariffVariants.map((tariffVariant) => convertTariffVariantImpl(unitPrice, tariffVariant, tariffId, baseJson));
}

function convertTariffImpl(source, productId, baseJson) {
    const tariff = {};
    tariff.id = source.id;
    tariff.product_id = productId;
    tariff.name = source.name;
    tariff.order = source.order;
    tariff.description = source.description;
    tariff.maximum_licenses_count = source.maximum_licenses_count;
    if (source.tariff_variants)
    {
        tariff.tariff_variants = convertTariffVariants(source.unit_price, source.tariff_variants, source.id, merge(baseJson, source.ops_json));
    }
    return tariff;
}

function convertTariffs(source, productId, baseJson) {
    return source.map(s => convertTariffImpl(s, productId, baseJson));
}

module.exports = createCoreService('api::product.product', ({ strapi }) => ({  
    convertTariffVariant(unitPrice, source, tariffId, baseJson) {
        return convertTariffVariantImpl(unitPrice, source, tariffId, baseJson);
    },

    convertTariff(source, productId, baseJson) {
        return convertTariffImpl(source, productId, baseJson);
    },

    convertProduct(srcProduct)
    {
        const product = {};
        product.id = srcProduct.id;        
        product.name = srcProduct.name;        
        product.createdAt = srcProduct.createdAt;        
        product.updatedAt = srcProduct.updatedAt;
        if (srcProduct.tariffs)       
        {
            product.tariffs = convertTariffs(srcProduct.tariffs, srcProduct.id, srcProduct.ops_json);
        }

        return product;
    }
}));
