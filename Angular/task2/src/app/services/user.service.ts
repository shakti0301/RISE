import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(private http: HttpClient) {}

  getUser() {
    return this.http.get('https://jsonplaceholder.typicode.com/users');
  }
  createUser(user: any) {
    return this.http.post('https://jsonplaceholder.typicode.com/users', user);
  }
  updateUser(id: number, user: any) {
    return this.http.put(
      `https://jsonplaceholder.typicode.com/users/${id}`,
      user,
    );
  }
  deleteUser(id: number) {
    return this.http.delete(`https://jsonplaceholder.typicode.com/users/${id}`);
  }
}
