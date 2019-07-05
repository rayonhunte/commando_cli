import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class ProductService {
  product$: Observable<any>;
  constructor(private http: HttpClient) { }

getAllProduct() {
  this.product$ = this.http.get('http://localhost:3000/all').pipe(
    map(
      (p: any[]) => p
    ), catchError(
      (err) => throwError(err)
    )
  );
}

}
