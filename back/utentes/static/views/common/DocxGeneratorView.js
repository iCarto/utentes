Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.DocxGeneratorView = Backbone.View.extend({
    initialize: function(options) {
        this.options = options || {};
        var data = this.options.data;

        var self = this;

        self.fetchTemplateAsArrayBuffer(data.urlTemplate).then(template =>
            docxTemplates
                .createReport({
                    template,
                    data,
                    cmdDelimiter: "***",
                    additionalJsContext: {
                        // Creates a base64 string with the image data

                        imageGenerator: function(url, width, height, outputFormat) {
                            return new Promise(function(resolve) {
                                var image = new Image();
                                // image.extension = ".png";
                                image.onload = function() {
                                    var canvas = document.createElement("CANVAS");
                                    var ctx = canvas.getContext("2d");
                                    const imageDPI = 96;
                                    const CENTIMETER_PER_INCH = 2.54;
                                    canvas.height = this.naturalHeight;
                                    canvas.width = this.naturalWidth;
                                    ctx.drawImage(this, 0, 0);
                                    var dataUrl = canvas.toDataURL("image/png", 1);
                                    resolve({
                                        height:
                                            (this.naturalHeight * CENTIMETER_PER_INCH) /
                                            imageDPI,
                                        width:
                                            (this.naturalWidth * CENTIMETER_PER_INCH) /
                                            imageDPI,
                                        data: dataUrl.slice(
                                            "data:image/png;base64,".length
                                        ),
                                        extension: ".png",
                                    });
                                };
                                image.src = url;
                            });
                        },
                    },
                })
                .then(function(report) {
                    self.saveDataToFile(report, data.nameFile);
                })
        );
    },

    fetchTemplateAsArrayBuffer: function(templateURL) {
        function checkStatus(response) {
            if (!response.ok) {
                throw new Error(`HTTP ${response.status} - ${response.statusText}`);
            }
            return response;
        }

        return fetch(templateURL)
            .then(response => checkStatus(response) && response.arrayBuffer())
            .then(buffer => buffer) // can be removed, just here in case a console.log or some debugging is need
            .catch(err => console.error(err)); // Never forget the final catch!
    },

    saveDataToFile: function(data, fileName) {
        const blob = new Blob([data], {
            type:
                "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        });
        const url = window.URL.createObjectURL(blob);
        this.downloadURL(url, fileName);
        setTimeout(() => {
            window.URL.revokeObjectURL(url);
        }, 1000);
    },

    downloadURL: function(data, fileName) {
        const a = document.createElement("a");
        a.href = data;
        a.download = fileName;
        document.body.appendChild(a);
        a.style = "display: none";
        a.click();
        a.remove();
    },
});
