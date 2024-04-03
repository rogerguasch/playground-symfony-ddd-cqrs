<?php

namespace App\Web\Landing\UI\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

class LandingController extends AbstractController
{
    public function __invoke(): Response
    {
        return $this->render('web/landing/landing.html.twig');
    }
}
