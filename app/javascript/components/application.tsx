import React from "react";
import ReactDOM from "react-dom/client"
import ScheduleVisitModal from "./schedule_visit_modal"
import { ChakraProvider } from '@chakra-ui/react'

document.addEventListener("DOMContentLoaded", () => {
  const token = document.querySelector('meta[name="csrf-token"]').content;
  const registrationForm = ReactDOM.createRoot(document.getElementById("registration-form"));
  registrationForm.render(
    <ChakraProvider><ScheduleVisitModal/></ChakraProvider>
  );
});