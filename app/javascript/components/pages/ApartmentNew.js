import React, {useState} from "react"
import { Form, FormGroup, Label, Input, Button } from "reactstrap"


const ApartmentNew = ({createApartment}) => {



  const [ newApartment, setNewApartment] = useState({
    street: "",
    city: "",
    state: "",
    manager: "",
    email: "",
    price: 0 ,
    bedrooms: 0,
    bathrooms: 0,
    pets: "",
    image: ""
  })

  const handleChange = (e) => {
   
    setNewApartment({...newApartment, [e.target.name]:e.target.value})
  }

  const handleSubmit = () => {
    createApartment(newApartment)
    console.log(newApartment)
    
  }

  return (
    <>
      <h3>Enter New Listing</h3>

      <Form>
      <FormGroup>
        <Label for="street">
          Street
        </Label>
        <Input
          name="street"
          placeholder="What the street?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.street }
        />
      </FormGroup>
      <FormGroup>
        <Label for="city">
          City
        </Label>
        <Input
          name="city"
          placeholder="What is the city?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.city }
        />
      </FormGroup>
      <FormGroup>
        <Label for="state">
          State
        </Label>
        <Input
          name="state"
          placeholder="What is the state?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.state }
        />
      </FormGroup>
      <FormGroup>
        <Label for="manager">
          Manager
        </Label>
        <Input
          name="manager"
          placeholder="What is the manager's name?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.manager }
        />
      </FormGroup>
      <FormGroup>
        <Label for="email">
          Email
        </Label>
        <Input
          name="email"
          placeholder="What is your email?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.email }
        />
      </FormGroup>
      <FormGroup>
        <Label for="price">
          Price
        </Label>
        <Input
          name="price"
          placeholder="What is the price?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.price }
        />
      </FormGroup>
      <FormGroup>
        <Label for="bedrooms">
          Bedrooms
        </Label>
        <Input
          name="bedrooms"
          placeholder="How many bedrooms?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.bedrooms }
        />
      </FormGroup>
      <FormGroup>
        <Label for="bathrooms">
          Bathrooms
        </Label>
        <Input
          name="bathrooms"
          placeholder="How many bathrooms?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.bathrooms }
        />
      </FormGroup>
      <FormGroup>
        <Label for="pets">
          Pets
        </Label>
        <Input
          name="pets"
          placeholder="Are pets allowed?"
          type="text"
          onChange={ handleChange }
          value={ newApartment.pets }
        />
      </FormGroup>
      <FormGroup>
        <Label for="image">
          Image
        </Label>
        <Input
          name="image"
          placeholder="Please upload an image"
          type="url"
          onChange={ handleChange }
          value={ newApartment.image }
        />
      </FormGroup>
      <Button onClick={handleSubmit} name="submit">
        Submit
      </Button>
    </Form>
    </>
  )
}

export default ApartmentNew
