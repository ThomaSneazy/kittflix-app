
const booking = () => {
  const form = document.querySelector("form")
  const start = document.querySelector("#booking_start_date")
  const end = document.querySelector("#booking_end_date")
  const price = document.getElementById("price")
  const button = document.querySelector("#submit")
  const modal = document.querySelector("#modal")

  console.log(modal)



  if (button) {
    button.addEventListener('click', (e) => {

       const pricePerDay = price.dataset.price
       const numberOfDay = (new Date(end.value).getDate() - new Date(start.value).getDate())
       const full_price = pricePerDay * numberOfDay
       window.alert(`Your booking will start: ${start.value} until: ${end.value}   ${full_price < 0 ? 'Unvalid' :'total: '+ full_price }  `)

//         modal.innerHTML += `
//         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
//   <div class="modal-dialog">
//     <div class="modal-content">
//       <div class="modal-header">
//         <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
//         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
//       </div>
//       <div class="modal-body">
//         start_date ${start.value}  end_date ${end.value}
//         ${pricePerDay * numberOfDay} $
//       </div>
//       <div class="modal-footer">
//         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
//         <input type="submit" name="commit" value="Rent" class="btn text-center btn btn-danger" data-disable-with="Rent">
//       </div>
//     </div>
//   </div>
// </div>

//         `

    })
  }
}

export { booking };
