docx-templates does not provide a "compiled" version of the library. The easiest way to generate it is explained [in this ticket](https://github.com/guigrpa/docx-templates/issues/77)

```
git clone https://github.com/guigrpa/docx-templates
cd docx-templates/examples/example-browserify
yarn install
yarn build
cp public/docx-templates.js "${UTENTES_API_REPO}"/.../docx-templates.js
```
