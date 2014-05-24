window.App.Views.UserShow = Backbone.CompositeView.extend ({
    template: JST["users/show"],

    initialize: function () {
        var view = this;
        this.listenTo(this.model, "sync", this.render);
        this.listenTo(this.model.interests(), "add", this.addInterest);
        this.listenTo(this.model.interests(), "remove", this.removeInterest);
        
        this.model.interests().each (function (interests) {
            view.addInterest(interest);
        });
    },
    
    addInterest: function (interest) {
        var interestShowView = new App.Views.InterestShow({model: interest});
        this.addSubview(".interests", interestShowView);
        interestShowView.render();
    },
    
    removeInterest: function (interest) {
        var interestShowView = 
        _(this.subviews()[".interests"]).find (function (subview) {
            return subview.model == interest;
        });
       
        this.removeSubview(".interests", interestShowView);
    },
    
    render: function () {
        var view = this;
        var content = this.template({user: this.model});
        this.$el.html(content);
        this.renderSubviews();
        return this;
    },
     
});