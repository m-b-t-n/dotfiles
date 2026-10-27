-- https://github.com/vinnymeller/swagger-preview.nvim

return {
    {
        "vinnymeller/swagger-preview.nvim",
        cmd = {
            "SwaggerPreview",
            "SwaggerPreviewStop",
            "SwaggerPreviewToggle",
        },
        build = "npm i",
        config = true,
        opts = {},
    },
}

