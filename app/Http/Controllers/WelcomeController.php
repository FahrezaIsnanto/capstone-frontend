<?php

namespace App\Http\Controllers;

use App\Services\InformasiService;
use Inertia\Inertia;

class WelcomeController extends Controller
{
    public function index()
    {
        return Inertia::render("Welcome");
    }
}
