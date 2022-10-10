<?php

$data = ["status" => "ok", "days" => "0"];
header("Content-Type: application/json");
echo json_encode($data);