
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="style.jsp"%>    

<!DOCTYPE html>
<html>
<head>

<title>aboutme</title>
<style>
html,
body,
.intro {
  height: 100%;
}

.bg-image-vertical {
  position: relative;
  overflow: hidden;
  background-repeat: no-repeat;
  background-position: right center;
 
  background-size: auto 100%;
}
</style>
</head>
<body>

<div class = container>
<section class="intro">
  <div class="bg-image-vertical h-100" style="background-color: #EFD3E4;
          background-image: url('./img/berry.jpg');
        ">
    <div class="mask d-flex align-items-center h-100">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-lg-10">
            <div class="card" style="border-radius: 1rem;">
              <div class="card-body p-5">

                <h1 class="mb-5 text-center">About You </h1>

                <form action="aboutme" method="post" >
                  <!-- 2 column grid layout with text inputs for the first and last names -->
                  <div class="row">
                    <div class="col-4 col-md-3 mb-2">
                      <div class="form-outline">
                      
                        <input type="text" name="weight" class="form-control" />
                        <label class="form-label" for="weight">Current weight in kgs</label>
                      </div>
                    </div>
                    
                    <div class="col-4 col-md-3 mb-2">
                      <div class="form-outline">
                        <input type="text" name="height" class="form-control" />
                        <label class="form-label" for="height">Height in cms</label>
                      </div>
                    </div>
                    
                     <div class="col-4 col-md-3 mb-2">
                      <div class="form-outline">
                        <input type="text" name="goal" class="form-control" />
                        <label class="form-label" for="goal">Goal weight</label>
                      </div>
                    </div>
                      <div class="col-4 col-md-3 mb-2">
                      <div class="form-outline">
                        <input type="text" name="age" class="form-control" />
                        <label class="form-label" for="age">Age</label>
                      </div>
                    </div>
                  </div>

              

                  <!-- radio button -->
                  <div class="col-md-6 mb-4">

                    <h6 class="mb-2 pb-1">How would you describe your activity today </h6>

                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="activities"
                        id="activities"
                        value="sedentary"
                      />
                      <label class="form-check-label" for="sedentary">Sedentary/Lightly Active</label>
                    </div>

                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="activities"
                        id="activities"
                        value="active"
                      />
                      <label class="form-check-label" for="active">Active/ Moderately active</label>
                    </div>

                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="activities"
                        id="activities"
                        value="vigorous"
                      />
                      <label class="form-check-label" for="vigorous">Vigorous/ Vigorously active</label>
                    </div>
                  </div>
<!--  radio button 2 - cuisine -->

            <div class="col-md-6 mb-4">

                    <h6 class="mb-2 pb-1">What is your preferred cuisine?</h6>

                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="cuisine"
                        id="cuisine"
                        value="asian"
                      />
                      <label class="form-check-label" for="sedentary">Asian</label>
                    </div>

                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="cuisine"
                        id="cuisine"
                        value="english"
                      />
                      <label class="form-check-label" for="active">English</label>
                    </div>

                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="radio"
                        name="cuisine"
                        id="cuisine"
                        value="mixed"
                      />
                      <label class="form-check-label" for="mixed">Vegetarian</label>
                    </div>
                  </div>



                  <!-- Checkbox -->
                  <div class="form-check d-flex justify-content-center mb-4">
                    <input
                      class="form-check-input me-2"
                      type="checkbox"
                      value=""
                      name="permit"
                      checked
                    />
                    <label class="form-check-label" for="permit"> I allow the application to save my data </label>
                  </div>

                  <!-- Submit button -->
                  <button type="submit" class="btn btn-secondary btn-rounded btn-block">Submit</button>
                  <a class="btn btn-secondary btn-rounded btn-block " href="home.jsp">Go to Home</a>
                </form>
            
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</div>
</body>

</html>