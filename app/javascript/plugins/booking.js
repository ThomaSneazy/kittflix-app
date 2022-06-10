
const booking = () => {
  const form = document.querySelector("form")
  const start = document.querySelector("#booking_start_date")
  const end = document.querySelector("#booking_end_date")
  const price = document.getElementById("price")
  const button = document.querySelector("#submit")



  if (button) {
    button.addEventListener('click', (e) => {
      // console.log(new Date(start.value))
      // console.log(new Date(end.value))
       const pricePerDay = price.dataset.price
       const numberOfDay = (new Date(end.value).getDate() - new Date(start.value).getDate())
       console.log(price_per_day * numberOfDay)
    })
  }
}

export { booking };
