console.log("hello from profile");

const formatToPhone123 = (event) => {
  const input = event.target.value.replace(/\D/g, "").substring(0, 10);
  const areaCode = input.substring(0, 3);
  const middle = input.substring(3, 6);
  const last = input.substring(6, 10);

  if (input.length > 6) {
    event.target.value = `(${areaCode}) ${middle} - ${last}`;
  } else if (input.length > 3) {
    event.target.value = `(${areaCode}) ${middle}`;
  } else if (input.length > 0) {
    event.target.value = `(${areaCode}`;
  }
};

document.addEventListener("DOMContentLoaded", function () {
  const inputElement = document.getElementById("phone-number");
  if (inputElement) {
    inputElement.addEventListener("keyup", formatToPhone123);
  }
});
