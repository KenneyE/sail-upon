window.App.Models.Interest = Backbone.Model.extend ({
    url: function () {        
        if (this.model.isNew) {
            return "api/interests";
        } else {
            return "api/interests/" + this.model.id;
        }
    },
    
});