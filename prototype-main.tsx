import React from "react";
import {createRoot} from "react-dom/client";
import Home from "./app/page";
import "./app/globals.css";

const style=document.createElement("style");
style.textContent=`.warehouse-hero{background-image:url('${import.meta.env.BASE_URL}warehouse-dashboard.png')}`;
document.head.appendChild(style);
createRoot(document.getElementById("root")!).render(<React.StrictMode><Home/></React.StrictMode>);
