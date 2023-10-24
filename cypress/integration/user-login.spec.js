/// <reference types="cypress" />

context('User login', () => {

  let baseUrl;

  beforeEach(() => {

    // uses env variables
    // cy.visit(Cypress.env("baseUrl"));

    // uses e2e baseUrl
    cy.visit("/");

    // Saves the baseUrl to compare when redirecting to home
    cy.url().then(url => {
      baseUrl = url;
    });

  });
  it("should redirect to homepage after login", () => {
    cy.login('bob@morane.ca', '1111');

    cy.url()
      .should('equal', baseUrl);

  });

});