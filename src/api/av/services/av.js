'use strict';

/**
 * av service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::av.av');
