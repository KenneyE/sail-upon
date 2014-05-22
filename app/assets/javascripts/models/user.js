window.App.Models.User = Backbone.Model.extend ({
    url: function () {
        
        if (this.id) {
            return "api/users/" + this.id;
        } else {
            return "api/user"
        }
    },

    interests: function () {
        this._interests = this._interests || 
            new App.Collections.UserInterests([], {user: this});
        return this._interests;
    },
    
    parse: function (resp) {
        if (resp.interests) {
            this.interests().set(resp.interests, {parse: true});
            delete resp.interests;
        }
        return resp;
    }
});