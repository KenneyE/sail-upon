window.App.Views.NewSiteModalShow = Backbone.View.extend ({
    template: JST["shared/new_site_modal"],
    
    render: function () {
        var content = this.template();
        this.$el.html(content);
        return this;
    },
    
    events: {
        "submit form": "createSite",
    },
    
    createSite: function (event) {
        event.preventDefault();
        var $form = $(event.target);
        var formData = $form.serializeJSON().website;
        
        var validForm = true;
        
        if (formData.website_interests[0] === "") {
            $("#website-website_interest").toggle("highlight", function () {
                $("#website-website_interest").toggle("highlight");
            });
            validForm = false;
        } 
        
        if (formData.url === "") {
            $("#website-url").toggle("highlight", function () {
                $("#website-url").toggle("highlight");
            });
            validForm = false;
        } 
        
        if (validForm) {
            var website = new App.Models.Website();
            website.save(formData, {
                success: function () {
                    $form.find("input[type=text]").val("");
                    $('#new-website-form').modal('hide');
                },
            });
        }
    },
});