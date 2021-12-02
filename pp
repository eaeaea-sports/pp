Skip to content
 
Search…
All gists
Back to GitHub
Sign in
Sign up
Instantly share code, notes, and snippets.

@jacksonfdam
jacksonfdam/doodle.js
Forked from TCotton/doodle.js
Created 9 years ago
0
0
 Code
 Revisions 2
<script src="https://gist.github.com/jacksonfdam/5818319.js"></script>
doodle.js
function html5_canvas() {
    // declare variables
    var $canvas, $element, $circle, $rect, $triangle, $x, $limit, $angle, $centerY, $range, $speed;

    //dom block element wrapper
    $element = doodle.createDisplay("canvas");
    //creates new canvas element wrapper
    $canvas = $element.createLayer();

    // function to create a random number


    function random_num($value) {

        $result = Math.floor(Math.random() * $value);

        return $result;

    }

    // create 50 cirlces with random colour, size and position
    $limit = 50;

    // loop 50 times
    for ($x = $limit; $x--;) {

        $ball = doodle.createSprite();
        // use Math.random()*0xFFFFFF, Math.random() to create a random number
        $ball.graphics.beginFill(Math.random() * 0xFFFFFF, Math.random());
        // circles are sizes 1 to 10px wide
        $ball.graphics.circle(0, 0, random_num(10));
        $ball.graphics.endFill();

        // radnom positions throughout the canvas
        $ball.x = random_num(750);
        $ball.y = random_num(600);

        // append the balls to the canvas
        $canvas.addChild($ball);

    }

    //create a circle
    $circle = doodle.createSprite();
    // give the cirlce a colour
    $circle.graphics.beginFill(0xfff10c);
    // give the circle a width of 100px
    $circle.graphics.circle(0, 0, 100);
    $circle.graphics.endFill();

    // positon the circle in the middle of hte canvase
    $circle.x = $element.width / 2;
    $circle.y = $element.height / 2;

    // append the cicle to the canvas
    $canvas.addChild($circle);

    //create a rectangle
    $rect = doodle.createSprite();
    $rect.graphics.beginFill(0xFFFFFF);
    $rect.graphics.rect(0, 0, 100, 150);
    $rect.graphics.endFill();
    $rect.x = 150;
    $rect.y = 150;

    $canvas.addChild($rect);

    // create a triangle with lines
    $triangle = doodle.createSprite();
    // start the lines at an axis of 500 x 150
    $triangle.x = 500;
    $triangle.y = 150;
    $triangle.graphics.beginPath();
    // the first line starts at the axis set above
    $triangle.graphics.lineTo(200, 0);
    $triangle.graphics.lineTo(100, 100);
    $triangle.graphics.lineTo(0, 0);
    $triangle.graphics.stroke();

    $canvas.addChild($triangle);

    $angle = 0, $centerY = 200, $range = 10, $speed = 0.5;

    // create the event listener
    $canvas.addListener(doodle.events.Event.ENTER_FRAME, onEnterFrame);

    // create the animation here


    function onEnterFrame(event) {
        $triangle.y = $centerY + Math.sin($angle) * $range;
        $angle += $speed;
    }



} // end function html5_canvas

function init() {

    html5_canvas();

}


// call init function
window.addEventListener("load", init, false);
 to join this conversation on GitHub. Already have an account? Sign in to comment
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
