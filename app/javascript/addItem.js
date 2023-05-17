let images = [];
let container = document.getElementById("upload");

window.loadFiles = function (event) {
  const pictures = event.target.files;
  for (let i = 0; i < pictures.length; i++) {
    images.push(pictures[i]);
  }
  showImages(images);
};

const showImages = (images) => {
  container.innerHTML = "";
  for (let i = 0; i < images.length; i++) {
    const div = document.createElement("div");
    div.classList.add("form_post__container");
    const img = document.createElement("img");
    img.classList.add("form_post__picture", "output");
    img.src = URL.createObjectURL(images[i]);
    const deleteDiv = document.createElement("div");
    deleteDiv.classList.add("form_post__delete");
    deleteDiv.innerHTML = `<a class="form_post__delete__icon"><i class="fa-solid fa-trash"></i></a>`;
    deleteDiv.addEventListener("click", () => deleteImage(i));
    div.appendChild(img);
    div.appendChild(deleteDiv);
    container.appendChild(div);
  }
};

window.deleteImage = function (position) {
  images.splice(position, 1);
  showImages(images);
};
