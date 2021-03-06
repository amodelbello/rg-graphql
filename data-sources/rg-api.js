const { RESTDataSource } = require('apollo-datasource-rest');
require('dotenv').config();

class RedOrGreenAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = process.env.API_URL;
  }

  willSendRequest(request) {
    request.headers.set('Authorization', this.context.auth.token);
  }

  /********************************
   * BUSINESSES
   ********************************/
  async getBusinesses() {
    const businesses = await this.get('/businesses');
    return businesses.data;
  }

  async getBusiness(businessId) {
    const business = await this.get(`/businesses/${businessId}`);
    return business.data;
  }

  async addBusiness(business) {
    const addedBusiness = await this.post('/businesses', business.input);
    return addedBusiness.data;
  }

  /********************************
   * RATINGS
   ********************************/
  async getRatingsByBusinessId(businessId = null) {
    if (businessId !== null) {
      const ratings = await this.get(`/ratings/b/${businessId}`);
      return ratings.data;
    }
  }

  async getRatingsByUserId(userId = null) {
    if (userId !== null) {
      const ratings = await this.get(`/ratings/u/${userId}`);
      return ratings.data;
    }
  }

  async getRating(ratingId) {
    const rating = await this.get(`/ratings/${ratingId}`);
    return rating.data;
  }

  async addRating(rating) {
    const addedRating = await this.post('/ratings', rating.input);
    return addedRating.data;
  }

  async editRating(rating) {
    const addedRating = await this.put(
      `/ratings/${rating.input.id}`,
      rating.input
    );
    return addedRating.data;
  }

  async deleteRating(ratingId) {
    const deletedRating = await this.delete(`/ratings/${ratingId}`);
    return deletedRating.data;
  }

  /********************************
   * AUTH
   ********************************/
  async login(email, password) {
    const token = await this.post('/login', { email, password });

    return token.data.token;
  }

  async register(email, username, password) {
    const token = await this.post('/register', { email, username, password });

    return token.data.token;
  }

  /********************************
   * Categories
   ********************************/
  async getCategories() {
    const categories = await this.get('/categories');
    return categories.data;
  }
}

module.exports = RedOrGreenAPI;
