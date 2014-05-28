window.App.Models.Interest = Backbone.Model.extend ({
    url: function () {        
        if (this.isNew) {
            return "api/interests";
        } else {
            return "api/interests/" + this.id;
        }
    },
    
    follow: function () {  
        $.ajax({
            url:  "api/user_interests/" + this.id,
            dataType: 'json',
            type: 'POST',
        });
    },
    
    unfollow: function () {        
        $.ajax({
            url:  "api/user_interests/" + this.id,
            dataType: 'json',
            type: 'DELETE',
        });
    },
});