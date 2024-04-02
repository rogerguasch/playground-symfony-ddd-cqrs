<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

class ByeController extends AbstractController
{
    public function bye(): Response
    {
        $number = random_int(0, 100);

        return $this->render('bye/number.html.twig', [
            'number' => $number,
        ]);
    }
}
