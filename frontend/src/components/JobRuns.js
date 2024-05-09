import React, { useContext, useState } from "react";
import { Table, Button } from "react-bootstrap";
import { JobRunsContext } from "../Context/JobRunsContext";
import JobRunModal from "./Modals/JobModal";

const JobRunsViewer = () => {
  const { jobRuns } = useContext(JobRunsContext);
  const [showModal, setShowModal] = useState(false);
  const { updateJobRuns } = useContext(JobRunsContext);

  const handleSubmit = async (formData) => {
    console.log(formData)
    try {
      // Make a PUT request to update the job run data on the server
      const response = await fetch(`${process.env.REACT_APP_SERVER_URL}jobs`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formData),
      });

      if (!response.ok) {
        throw new Error("Failed to update job run data");
      }

      // If the request is successful, update the job runs context with the new data
      updateJobRuns([...jobRuns, formData]);
    } catch (error) {
      console.error("Error updating job run data:", error);
    }
    setShowModal(false)
  };

  const handleOpenModal = () => {
    setShowModal(true);
  };

  const handleCloseModal = () => {
    setShowModal(false);
  };

  
  return (
    <div className="table-container">
      <div className="table-wrapper">
        <Button variant="secondary" onClick={handleOpenModal} className="open-modal-btn mb-3 btn-sm">
          Add Job Run
        </Button>
        <Table striped bordered hover size="sm" className="data-text">
          <thead>
            <tr>
              <th>Job Date</th>
              <th>PO Number</th>
              <th>Job Type</th>
              <th>Truck ID</th>
              <th>Driver ID</th>
              <th>Starting Mileage</th>
              <th>End Mileage</th>
              <th>Pickup Location</th>
              <th>Delivery Location</th>
              <th>Pay Amount</th>
              <th>Status</th>
              <th>Completed Time</th>
              <th>Notes</th>
            </tr>
          </thead>
          <tbody>
            {jobRuns.map((jobRun, index) => (
              <tr key={jobRun.id || index}>
                <td>
                  {new Date(jobRun.job_date).toISOString().split("T")[0].split("-").slice(1).concat(new Date(jobRun.job_date).toISOString().split("T")[0].split("-")[0]).join("/")}
                </td>
                <td>{jobRun.po_number}</td>
                <td>{jobRun.job_type}</td>
                <td>{jobRun.truck_id}</td>
                <td>{jobRun.driver_id}</td>
                <td>{jobRun.starting_mileage}</td>
                <td>{jobRun.ending_mileage}</td>
                <td>{jobRun.pickup_location}</td>
                <td>{jobRun.delivery_location}</td>
                <td> ${jobRun.job_pay}</td>
                <td>{jobRun.status}</td>
                <td>{jobRun.complete_time ? new Date(jobRun.complete_time).toLocaleString() : ""}</td>
                <td>{jobRun.notes}</td>
              </tr>
            ))}
          </tbody>
        </Table>
        <JobRunModal showModal={showModal} handleClose={handleCloseModal} handleSubmit={handleSubmit} />
      </div>
    </div>
  );
};

export default JobRunsViewer;
