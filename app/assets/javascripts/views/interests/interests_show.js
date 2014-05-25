window.App.Views.InterestShow = Backbone.View.extend ({

    // className: "col-xs-2",

    initialize: function (options) {
        var view = this;
        this.user = options.user;
        this.listenTo(this.model, "sync", this.render);
    
        var current_user_json =
        JSON.parse($("#current_user_json").html()).current_user;
        this.current_user = new App.Models.User({ id: current_user_json.id });
    
        this.current_user.fetch({ success: function () {        
            var interests =  view.current_user.interests();
            view.is_interested = (_.find(interests.models, function (interest) {
                return interest.id === view.model.id;
            }));
            view.render();
        }
    });},

    events: {
        "click .follow-btn": "toggleFollow", 
    },

    render: function () {
        var content = this.template({ interest: this.model, 
                                      interested: this.is_interested});
        var img_name = this.model.get("name").replace(" ", "_");
        var src = "interests/" + 
                    img_name + 
                    ".jpg";
        this.$el.data(String(this.model.id));
        this.$el.html(content);
        this.$el.find(".interest-panel-image > img").attr("src", src)
        return this;
    },

    template: JST["interests/show"],

    toggleFollow: function (event) {
        var view = this;
        if (view.is_interested) {
            view.model.unfollow();
            view.current_user.interests().remove(view.model);
        } else {
            view.model.follow();
            view.current_user.interests().add(view.model); 
        }
        $(event.target.parentElement).find(".follow-btn").toggleClass("hidden");
    },

});