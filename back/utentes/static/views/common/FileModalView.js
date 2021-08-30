Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.FileModalView = Backbone.View.extend({
    options: {
        openElementId: "#file-modal",
        title: "Arquivo Electr&oacute;nico",
        uploadInmediate: true,
    },

    initialize: function(options) {
        this.options = _.defaults(options || {}, this.options);

        if (this.options.uploadInmediate) {
            if (this.model) {
                let defaultDataForFileModal = this._getDefaultDataForFileModal(
                    this.model.get("id")
                );
                this.options.urlBase = defaultDataForFileModal.defaultUrlBase;
                this.options.id = defaultDataForFileModal.defaultFolderId;
            } else {
                this.options.urlBase = Backbone.SIXHIARA.Config.apiDocumentos;
                // this.options.id = this.options.id
            }
        }

        this.fileModalView = new Backbone.DMS.FileModalView(this.options);
    },

    _getDefaultDataForFileModal(id) {
        var data = {
            defaultUrlBase: Backbone.SIXHIARA.Config.apiDocumentos,
            defaultFolderId: id,
        };
        if (!iAuth.isAdmin() && !iAuth.isObservador()) {
            if (iAuth.getGroup() == SIRHA.GROUP.BASIN_DIVISION) {
                data.defaultUrlBase =
                    Backbone.SIXHIARA.Config.apiDocumentos +
                    "/" +
                    id +
                    "/" +
                    iAuth.getGroup();
                data.defaultFolderId = iAuth.getDivisao();
            } else {
                data.defaultUrlBase = Backbone.SIXHIARA.Config.apiDocumentos + "/" + id;
                data.defaultFolderId = iAuth.getGroup();
            }
        }
        return data;
    },

    hasPendingFiles: function() {
        return this.fileModalView.hasPendingFiles();
    },

    handlePendingFiles: function(model) {
        let fileModalView = this.fileModalView;

        function savePendingFiles(model) {
            fileModalView.saveFiles({
                uploadFinished: function(success) {
                    if (success) {
                        fileModalView._close();
                        bootbox.alert(
                            `A exploração&nbsp;<strong>${model.get(
                                "exp_id"
                            )} - ${model.get(
                                "exp_name"
                            )}</strong>&nbsp;tem sido criada correctamente.`,
                            function() {
                                window.location = Backbone.SIXHIARA.Config.urlPendentes;
                            }
                        );
                    } else {
                        bootbox.alert(
                            `<span style="color: red;">A exploração&nbsp;<strong>${model.get(
                                "exp_id"
                            )} - ${model.get(
                                "exp_name"
                            )}</strong>&nbsp;tem sido criada correctamente, pero produziu-se um erro ao enviar os arquivos. Informe ao administrador.</strong>`
                        );
                    }
                },
            });
        }

        let departamento = iAuth.isAdmin()
            ? SIRHA.GROUP.ADMINISTRATIVO
            : iAuth.getGroup();

        var url = Backbone.SIXHIARA.Config.apiDocumentos + "/" + model.get("id");
        this.fileModalView.show();
        this.fileModalView.setUrlBase(url);
        this.fileModalView.setId(departamento);
        this.fileModalView.onShown(savePendingFiles, model);
    },
});
