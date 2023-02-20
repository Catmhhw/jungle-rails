describe('Visit the home page of our Jungle App', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

	it("There is products on the page", () => {
		cy.get(".products article").should("be.visible");
	});

	it("There is 12 products on the page", () => {
		cy.get(".products article").should("have.length", 12);
	});

	it("users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one", () => {
		cy.wait(1000)
		cy.get('button.btn').first().scrollIntoView().click({ force: true });
		cy.get(".nav-item").should("contain", "My Cart (1)")
  });


})