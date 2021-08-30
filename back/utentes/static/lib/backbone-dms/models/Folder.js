Backbone.DMS = Backbone.DMS || {};

Backbone.DMS.Folder = Backbone.DMS.File.extend({
    // https://stackoverflow.com/questions/14614582/backbone-js-model-inheritance
    defaults: function() {
        return _.extend({}, Backbone.DMS.File.prototype.defaults, {
            path: new Backbone.DMS.FolderCollection(),
            files: new Backbone.DMS.FileCollection(),
        });
    },

    initialize: function() {
        Backbone.DMS.File.prototype.initialize.call(this);
        this.listenTo(this, "sync", this.fetchFullFolder);
    },

    parse: function(folderResponse) {
        this.get("files").url = folderResponse["files"];
        this.get("path").url = folderResponse["path"];
        return {
            id: folderResponse["id"],
            name: folderResponse["name"],
            type: folderResponse["type"],
            size: folderResponse["size"],
            url: folderResponse["url"],
            zip_url: folderResponse["zip_url"],
            date: new Date(folderResponse["date"]),
            permissions: folderResponse["permissions"],
        };
    },

    url: function() {
        if (this.get("url")) {
            return this.get("url");
        } else if (this.urlRoot && this.get("id")) {
            return this.urlRoot + "/" + this.get("id");
        } else {
            return "";
        }
    },

    fetchFullFolder: function() {
        this.fetchFiles();
        this.fetchPath();
    },

    fetchFiles: function() {
        if (this.get("files").url) {
            this.get("files").fetch({
                success: this.fetchFilesSuccess.bind(this),
            });
        }
    },

    fetchPath() {
        if (this.get("path").url) {
            this.get("path").fetch();
        }
    },

    fetchFilesSuccess: function(fileCollectionData) {
        if (this.get("files")) {
            this.reviewFilePermissions(this.get("files").models);
        }
    },

    reviewFilePermissions: function(files) {
        var folderPermissions = this.get("permissions");
        _.each(files, function(file) {
            var filePermissions = folderPermissions;
            if (file.get("permissions")) {
                filePermissions = file.get("permissions");
            }
            file.set("permissions", filePermissions);
        });
    },
});
