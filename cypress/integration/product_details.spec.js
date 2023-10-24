/// <reference types="cypress" />

context('Products Details Show', () => {
  beforeEach(() => {

    // uses env variables
    // cy.visit(Cypress.env("baseUrl"));

    // uses e2e baseUrl
    cy.visit("/");
  });

  it("should be able to click on 1st product to see its details page", () => {
    cy.get('.products article')
      .first()
      .click('center')
      .url()
      .should('include', 'products/2');

    cy.get('.product-detail').contains("Scented Blade");
  });
});