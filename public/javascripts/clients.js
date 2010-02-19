function updateClientForm(element, li){
  $('order_new_client_attributes__last_name').value = li.readAttribute('ln');
  $('order_new_client_attributes__address').value = li.readAttribute('ad');
  $('order_new_client_attributes__email').value = li.readAttribute('em');
}