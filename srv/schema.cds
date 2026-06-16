using com.procurement as db from '../db/schema';

// ─────────────────────────────────────────────
// Purchase Order Service
// ─────────────────────────────────────────────
service PurchaseOrderService @(path: '/procurement') {
   @odata.draft.enabled
    // ── Purchase Order Header ───────────────
     @requires: 'Viewer'
    entity PurchaseOrderHeaders as projection on db.PurchaseOrderHeader {
        *,
        items    // navigation to items
    }
    // ── Purchase Order Items ────────────────
     @requires: 'Viewer'
    entity PurchaseOrderItems as projection on db.PurchaseOrderItem {
        *,
        header   // back-navigation to header
    };
}
