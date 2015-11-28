<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $raw_json = file_get_contents('php://input');
  $json = json_decode($raw_json, true);
  $error = json_last_error();
  if(isset($json['report'])) {
      $data_array = $json['report'];
      $filename = "testing.json";
      file_put_contents($filename, json_encode($data_array));
      header('Content-Type: application/json');
      echo json_encode(['success' => 'Got the data!']);
      exit;
  }
  else {
      header('Content-Type: application/json');
      echo json_encode(['error' => 'Error: No data!']);
      exit;
  }
}

?>
