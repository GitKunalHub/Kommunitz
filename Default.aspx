<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <link href="filepond/dist/filepond.css" rel="stylesheet" />
        <link href="filepond/dist/filepond.min.css" rel="stylesheet" />
        <style>


                            .filepond--drop-label {
	                            color: #4c4e53;
                            }

                            .filepond--label-action {
	                            text-decoration-color: #babdc0;
                            }

                            .filepond--panel-root {
	                            border-radius: 2em;
	                            background-color: #edf0f4;
	                            height: 1em;
                            }

                            .filepond--item-panel {
	                            background-color: #595e68;
                            }

                            .filepond--drip-blob {
	                            background-color: #7f8a9a;
                            }

                         </style>
        <link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet" />
        <link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet" />
        <input multiple type="file" />

<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-transform/dist/filepond-plugin-image-transform.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
<script>
	
	FilePond.registerPlugin(
		FilePondPluginImageCrop,
		FilePondPluginImagePreview,
		FilePondPluginImageResize,
		FilePondPluginImageTransform
	);

	const inputElement = document.querySelector('input[type="file"]');
	const pond = FilePond.create(inputElement, {
		imageCropAspectRatio: 1,
		imageResizeTargetWidth: 256,
		imageResizeMode: 'contain',
		onaddfile: (err, fileItem) => {
			console.log(err, fileItem.getMetadata('resize'));
		},
		onpreparefile: (fileItem, outputFiles) => {
			outputFiles.forEach(output => {
				const img = new Image();
				img.src = URL.createObjectURL(output.file);
				document.body.appendChild(img);
			})
		}
	});
</script>
    
    </div>
    </form>
</body>
</html>
