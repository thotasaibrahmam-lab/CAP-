sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/PurchaseOrderHeadersList",
	"project1/test/integration/pages/PurchaseOrderHeadersObjectPage",
	"project1/test/integration/pages/PurchaseOrderItemsObjectPage"
], function (JourneyRunner, PurchaseOrderHeadersList, PurchaseOrderHeadersObjectPage, PurchaseOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrderHeadersList: PurchaseOrderHeadersList,
			onThePurchaseOrderHeadersObjectPage: PurchaseOrderHeadersObjectPage,
			onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

