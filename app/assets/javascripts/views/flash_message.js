var FlashMessage = Backbone.View.extend({
    initialize: function() {
        debugger
       Dispatcher.bind('show_flash_message', this.render);
    },

    render: function(msg, type) {
        debugger
        if (type === "success") {
            $(".alert-success").html(msg);            
        } else {
            $(".alert-error").html(msg);
        }
    }
});