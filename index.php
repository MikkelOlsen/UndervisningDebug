<?php
/**
 * Created by PhpStorm.
 * User: mcarp
 * Date: 16-11-2017
 * Time: 09:56
 */

ob_start();
session_start();

require_once './config.php';

$setting = new settings($db);
$user = new User($db);
$email = new Email($db);
$products = new Products($db);

if ($user->is_loggedin() == true) {
    $users = $user->getOne($_SESSION['user_id']);
}

include_once './inc/head.php';
include_once './inc/menu.php';

if ($user->is_loggedin() == true && $debug == 1){
    echo '<div class="debug">';
    echo '<h4><i class="fa fa-bug"></i> DEBUG MENU <i class="fa fa-bug"></i></h4>';
    echo '<p>'. print_r($_SESSION) .'</p>';
    echo '</div>';
}

if(isset($_POST['search'])) {
    if(strlen($_POST['navn']) > 6 || strlen($_POST['navn']) < 1) {
        $error['navn'] = '<div class="alert alert-danger alert-dismissible" id="myAlert">
            <a href="#" class="close">&times;</a>
            <i class="glyphicon glyphicon-warning-sign"></i>
            Din søgning skal være mellem 1 og 6 tegn.
            </div>';
    } else {
        $user->redirect('produkter&search='.$_POST['navn'].'');
    }
}

if ($user->secCheckMethod('POST') || $user->secCheckMethod('POST')) {
    $get = $user->secGetInputArray(INPUT_POST);
    if (isset($get['p']) && empty($get['p'])) {
        switch ($get['p']) {

            case 'forside';
                include_once './home.php';
                break;
            case 'omkring';
                include_once './about.php';
                break;
            case 'kontakt';
                include_once './contact.php';
                break;
            case 'logind';
                include_once './login.php';
                break;
            case 'logud';
                include_once './logout.php';
                break;
            case 'opret';
                include_once './signup.php';
                break;

            case 'joined';
                include_once './joined.php';
                break;

            case 'beskeder';
                include_once './messages.php';
                break;

            case 'sletEmail';
                include_once './deleteEmail.php';
                break;

            case 'opdater';
                include_once './update.php';
                break;

            case 'produkter';
                include_once './products.php';
                break;

            case 'search';
                include_once './search.php';
                break;

            case 'produkt';
                include_once './singleProduct.php';
                break;

            case 'nytProdukt';
                include_once './newProduct.php';
                break;

            case 'profil';
                include_once './profile.php';
                break;

            default:
                header('Location: index.php?side=forside');
                break;
        }
    } else {
        header('Location: index.php?side=forside');
    }
}

include_once './inc/footer.php';