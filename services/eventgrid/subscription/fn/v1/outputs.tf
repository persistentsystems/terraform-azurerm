output "name" {
    value = "${azurerm_eventgrid_event_subscription.subscription.name}"
}
output "id" {
    value = "${azurerm_eventgrid_event_subscription.subscription.id}"
}