function handleImage(image) {
  let render = new FileReader();
  render.onload = function() {
    let imagePreview = document.getElementById("product-image-preview");
    imagePreview.src = render.result;
    imagePreview.className += "img-fluid w-25";
  };
  console.log(image);
  render.readAsDataURL(image[0]);
}