window.App.Views.InterestsIndex = Backbone.View.extend ({
    initialize: function (options) {
        this.listenTo(this.collection, "add", this.render);
        this.listenTo(this.collection, "remove", this.render);
    },
    
    render: function () {
        var content = this.template();
        this.$el.html(content);
        
        var that = this;
        this.collection.each(function (interest) {
            var view = new App.Views.InterestShow({ model: interest });
            that.$el.find(".interests").append(view.render().$el);
        });
        
        var $container = this.$el.find('#all-interests');
        $container.hide();
        $container.masonry({
            itemSelector: '.interest-panel',
        });        
        // initialize
        $container.imagesLoaded( function () {
            $container.fadeIn('fast');
            $container.masonry({
                itemSelector: '.interest-panel',
                isFitWidth: true
            });
        })
        
        return this;
    },
    
    template: JST["interests/index"],
    
});