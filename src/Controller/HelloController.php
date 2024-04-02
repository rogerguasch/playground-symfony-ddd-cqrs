<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

class HelloController extends AbstractController
{
    public function hello(): Response
    {
        $number = random_int(0, 100);

        return $this->render('hello/number.html.twig', [
            'number' => $number,
        ]);

    }
}
