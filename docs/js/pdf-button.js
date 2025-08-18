// // PDF Export Button Functionality
// (function () {
//   'use strict';

//   // Wait for DOM to be ready
//   document.addEventListener('DOMContentLoaded', function () {
//     //   // Create PDF export button
//     //   const pdfButton = document.querySelector('#pdf-export-btn');

//     //   // pdfButton.className = 'pdf-export-btn';
//     //   // pdfButton.innerHTML = `
//     //   //       <span class="icon">��</span>
//     //   //       <span>Export PDF</span>
//     //   //     `;

//     //   // // Add button to page
//     //   // document.body.appendChild(pdfButton);

//     //   // Add click event
//     //   pdfButton.addEventListener('click', function () {
//     //     exportToPDF();
//     //   });

//     //   })

//     //   //     // Function to export to PDF
//     //   function exportToPDF() {
//     //     // Find PDF export button
//     //     const pdfButton = document.querySelector('#pdf-export-btn');
//     //     // Show loading state
//     //     // pdfButton.innerHTML = `
//     //     //   <span class="icon">⏳</span>
//     //     //   <span>Generating...</span>
//     //     // `;
//     //     pdfButton.disabled = true;

//     //     // Use browser's print functionality for PDF export
//     //     setTimeout(() => {
//     //       window.print();

//     //       // Reset button after a delay
//     //       setTimeout(() => {
//     //         pdfButton.innerHTML = `
//     //             <span class="icon">��</span>
//     //             <span>Export PDF</span>
//     //           `;
//     //         pdfButton.disabled = false;
//     //       }, 2000);
//     //     }, 500);
//     //   }
//     // });
//   });


// })();


// Function to export to PDF
function exportToPDF() {
  // Find PDF export button
  const pdfButton = document.querySelector('#pdf-export-btn');

  const currentDisplay = pdfButton.style.display;
  pdfButton.disabled = true;
  pdfButton.style.display = 'none';

  window.PPClose = false;
  // Use browser's print functionality for PDF export
  setTimeout(() => {
    window.print();

    // Reset button after a delay
    setTimeout(() => {
      pdfButton.disabled = false;
      pdfButton.style.display = currentDisplay;
      window.PPClose = true;
    }, 600);
  }, 500);
}

