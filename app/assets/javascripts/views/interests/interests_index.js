window.App.Views.InterestsIndex = Backbone.View.extend ({
    initialize: function () {
        this.listenTo(this.collection, "sync", this.render);
    },
    
    render: function () {
      var content = this.template();
      this.$el.html(content);
      var that = this;

      this.collection.each(function (interest) {
        var view = new App.Views.InterestShow({ model: interest });
        that.$el.append(view.render().$el);
      });
      return this;
    },

    template: JST["interests/index"],
});