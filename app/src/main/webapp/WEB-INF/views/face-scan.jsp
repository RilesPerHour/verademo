<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="WWE 2K26 Face Scan Tutorial">
<meta name="author" content="">

<title>WWE 2K26 Face Scan Tutorial</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">
<!-- Custom styles -->
<link href="resources/css/pwm.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body role="document">

    <div class="container">
        <div class="header clearfix">
            <nav>
                <ul class="nav nav-pills pull-right">
                    <li role="presentation"><a href="feed">Feed</a></li>
                    <li role="presentation"><a href="blabbers">Blabbers</a></li>
                    <li role="presentation"><a href="profile">Profile</a></li>
                    <li role="presentation"><a href="tools">Tools</a></li>
                    <li role="presentation" class="active"><a href="facescan">WWE 2K26 Face Scan</a></li>
                    <li role="presentation"><a href="logout">Logout</a></li>
                </ul>
            </nav>
            <img src="resources/images/Tokyoship_Talk_icon.svg" height="100" width="100">
        </div>
    </div>

    <div class="container theme-showcase" role="main">

        <div class="page-header">
            <h2>WWE 2K26 Face Scan Creation Tutorial</h2>
            <p class="lead">Follow the steps below to prepare and upload your face scan image for WWE 2K26 MyRISE or Create-a-Superstar.</p>
        </div>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="alert alert-danger" role="alert">
            <%= error %>
        </div>
        <%
            }
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
        <div class="alert alert-success" role="alert">
            <%= successMessage %>
        </div>
        <%
            String uploadedImage = (String) request.getAttribute("uploadedImage");
            if (uploadedImage != null) {
        %>
        <div class="text-center" style="margin-bottom: 20px;">
            <img src="<%= uploadedImage %>" alt="Your uploaded face scan"
                 style="max-width: 300px; max-height: 300px; border: 3px solid #d4af37; border-radius: 4px;" />
            <p><strong>Your uploaded face scan image</strong></p>
        </div>
        <%
            }
        }
        %>

        <div class="row">

            <!-- Tutorial Steps -->
            <div class="col-md-7">
                <div class="detailBox">
                    <div class="titleBox">
                        <label>Step-by-Step Face Scan Guide</label>
                    </div>
                    <div class="actionBox">

                        <h4>Step 1: Prepare Your Photo</h4>
                        <ul>
                            <li>Use a <strong>clear, front-facing photo</strong> of your face.</li>
                            <li>Face the camera directly with a <strong>neutral expression</strong> and closed mouth.</li>
                            <li>Ensure your entire face is visible &mdash; forehead to chin, ear to ear.</li>
                            <li>Remove glasses, hats, hoods, and any accessories that cover your face.</li>
                            <li>Tie back long hair so it does not obscure facial features.</li>
                        </ul>

                        <h4>Step 2: Lighting Requirements</h4>
                        <ul>
                            <li>Use <strong>even, diffuse lighting</strong> &mdash; avoid harsh shadows on either side of your face.</li>
                            <li>Face a light source (window or ring light) rather than having it behind you.</li>
                            <li>Avoid flash directly on your face as it washes out facial details.</li>
                            <li>A plain, light-colored background works best.</li>
                        </ul>

                        <h4>Step 3: Image Specifications</h4>
                        <table class="table table-bordered table-condensed">
                            <tbody>
                                <tr>
                                    <td><strong>Format</strong></td>
                                    <td>JPG or PNG</td>
                                </tr>
                                <tr>
                                    <td><strong>Minimum Resolution</strong></td>
                                    <td>512 &times; 512 pixels</td>
                                </tr>
                                <tr>
                                    <td><strong>Recommended Resolution</strong></td>
                                    <td>1024 &times; 1024 pixels or higher</td>
                                </tr>
                                <tr>
                                    <td><strong>Maximum File Size</strong></td>
                                    <td>5 MB</td>
                                </tr>
                                <tr>
                                    <td><strong>Aspect Ratio</strong></td>
                                    <td>1:1 (square) preferred</td>
                                </tr>
                                <tr>
                                    <td><strong>Color Mode</strong></td>
                                    <td>RGB (no grayscale or CMYK)</td>
                                </tr>
                            </tbody>
                        </table>

                        <h4>Step 4: In-Game Application</h4>
                        <ol>
                            <li>Launch WWE 2K26 and navigate to <strong>MyRISE</strong> or <strong>Create-a-Superstar</strong>.</li>
                            <li>Select <strong>Face Scan</strong> from the appearance customization menu.</li>
                            <li>Choose <strong>Import Photo</strong> and select your prepared image.</li>
                            <li>Use the in-game adjustment tools to align your face to the model template (align eyes, nose, and mouth markers).</li>
                            <li>Apply and fine-tune skin tone, facial hair, and other attributes in the appearance editor.</li>
                        </ol>

                        <h4>Tips for Best Results</h4>
                        <ul>
                            <li>Take the photo in good natural daylight for the most accurate skin tone.</li>
                            <li>Higher resolution photos produce sharper in-game textures.</li>
                            <li>If the auto-mapping looks off, use the manual anchor points to reposition.</li>
                            <li>Multiple scan attempts from slightly different angles can improve accuracy.</li>
                        </ul>

                    </div>
                </div>
            </div>

            <!-- Upload Panel -->
            <div class="col-md-5">
                <div class="detailBox">
                    <div class="titleBox">
                        <label>Upload Your Face Scan Image</label>
                    </div>
                    <div class="actionBox">
                        <p>Upload your prepared photo below to verify it meets the WWE 2K26 face scan specifications and save it for reference.</p>

                        <form method="post" action="facescan" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="faceImage">Select Face Photo (JPG or PNG, max 5 MB)</label>
                                <input type="file" class="form-control" id="faceImage" name="faceImage" accept=".jpg,.jpeg,.png" />
                            </div>

                            <div class="form-group">
                                <div id="imagePreviewContainer" style="display:none; margin-bottom: 10px;">
                                    <p><strong>Preview:</strong></p>
                                    <img id="imagePreview" src="#" alt="Image preview"
                                         style="max-width: 100%; max-height: 250px; border: 2px solid #ccc; border-radius: 4px;" />
                                    <p id="imageDimensions" class="text-muted" style="margin-top: 5px; font-size: 12px;"></p>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block">
                                Upload Face Scan Image
                            </button>
                        </form>

                        <hr/>

                        <div class="panel panel-info">
                            <div class="panel-heading"><strong>Quick Checklist</strong></div>
                            <div class="panel-body">
                                <ul class="list-unstyled" style="margin-bottom: 0;">
                                    <li>&#9744; Front-facing, neutral expression</li>
                                    <li>&#9744; No glasses or head coverings</li>
                                    <li>&#9744; Even lighting, no harsh shadows</li>
                                    <li>&#9744; At least 512&times;512 px resolution</li>
                                    <li>&#9744; JPG or PNG format, under 5 MB</li>
                                    <li>&#9744; Plain background preferred</li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="resources/js/jquery-1.11.2.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        document.getElementById('faceImage').addEventListener('change', function(e) {
            var file = e.target.files[0];
            if (!file) return;

            var reader = new FileReader();
            reader.onload = function(evt) {
                var img = document.getElementById('imagePreview');
                img.onload = function() {
                    document.getElementById('imageDimensions').textContent =
                        'Dimensions: ' + img.naturalWidth + ' x ' + img.naturalHeight + ' px' +
                        ' | Size: ' + (file.size / 1024).toFixed(1) + ' KB' +
                        (img.naturalWidth < 512 || img.naturalHeight < 512
                            ? ' — WARNING: below minimum 512x512 px' : ' — OK');
                };
                img.src = evt.target.result;
                document.getElementById('imagePreviewContainer').style.display = 'block';
            };
            reader.readAsDataURL(file);
        });
    </script>

</body>
</html>
