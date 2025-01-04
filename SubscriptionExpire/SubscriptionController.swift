import UIKit
import StoreKit

/*
 0. Manage Subscription > No subscriptions
 1. Redeem Code > Offer 1
 2. Manage Subscription > Check if Subscribed to Basic
 3. Redeem Code > Offer 2 with Trial
 4. Manage Subscription > Check if Subscription to Pro
 5. Wait 1 min for Trial to Expire > Manage Subscription > Pro subscription expired...
 */

class SubscriptionController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let windowScene = view.window?.windowScene else { return }
        switch indexPath.row {
        case 0:
            Task {
                try? await AppStore.showManageSubscriptions(in: windowScene)
            }
            
        case 1:
            Task {
                try? await AppStore.presentOfferCodeRedeemSheet(in: windowScene)
            }
            
        default:break
        }
    }
}
