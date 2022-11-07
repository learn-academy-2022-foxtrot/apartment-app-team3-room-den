import React from "react"
import { Card, CardBody } from "reactstrap"
import { NavLink } from "react-router-dom"

const ApartmentIndex = ({ apartments }) => {
  console.log(apartments)
  return (
    <>
      <h1>Available shit</h1>
      {apartments?.map((apartment, index) => {
        return (
          <div key={index} className="apartment-index">
            <Card style={{ width: "18rem" }}>
              <img src={apartment.image} alt="image of available apartment" />
              <CardBody>
                <NavLink to={`/apartment/${apartment.id}`}>
                  {apartment.price}
                </NavLink>
              </CardBody>
            </Card>
          </div>
        )
      })}
    </>
  )
}

export default ApartmentIndex
