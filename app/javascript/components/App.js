import React, { useState, useEffect } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";

import Footer from "./components/Footer";
import Header from "./components/Header";

import ApartmentEdit from "./pages/ApartmentEdit";
import ApartmentIndex from "./pages/ApartmentIndex";
import ApartmentNew from "./pages/ApartmentNew";
import ApartmentShow from "./pages/ApartmentShow";
import Home from "./pages/Home";
import NotFound from "./pages/NotFound";

const App = (props) => {
  const [apartments, setApartments] = useState([]);

  useEffect(() => {
    readApartments();
  }, []);

  const readApartments = () => {
    fetch("/apartments")
      .then((response) => response.json())
      .then((payload) => {
        console.log(payload);
        setApartments(payload);
      })
      .catch((error) => console.log(error));
  };

  const createApartment = ( newApartment ) => {
    fetch("/apartmentnew", {
      body: JSON.stringify(newApartment),
      headers: {
        "Content-Type": "application/json"
      },
      method: "POST"
    })
    .then(response => response.json())
    .then(()=> readApartment())
    .catch((errors) => console.log("Apartment create errors: ", errors))
  }

  return (
    <BrowserRouter>
      <Header {...props} />
      <Routes>
        <Route exact path="/" element={<Home />} />
        <Route
          path="/available-apartments"
          element={<ApartmentIndex apartments={apartments} />}
        />
        <Route path="/apartmentshow" element={<ApartmentShow />} />
        <Route path="/apartmentnew" element={<ApartmentNew createApartment={ createApartment }/>} />
        <Route path="/apartmentedit" element={<ApartmentEdit />} />
        <Route element={<NotFound />} />
      </Routes>
      <Footer />
    </BrowserRouter>
  );
};

export default App;
