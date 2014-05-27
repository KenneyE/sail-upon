window.App.Views.AboutShow = Backbone.View.extend ({
    template: JST["about"],
    
    render: function () {
       var content = this.template();
       this.$el.html(content);
       return this; 
    },
});