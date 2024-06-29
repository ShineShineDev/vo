<?php

namespace App\Traits;

use Illuminate\Support\Facades\File;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

trait FileUpload
{
    protected function uploadFile($file, $path, $prefix = null)
    {
        $file_name = $prefix . uniqid() . '.' . $file->getClientOriginalExtension();
        $file->move(public_path() . '/uploads/' . $path . '/', $file_name);
        $file_url = '/uploads/' . $path . '/' . $file_name;
        return [
            'path' => $file_url,
            'original_name' => $file->getClientOriginalName(),
            'stored_name' => $file_name,
            // 'file_size' => $file->getSize(),
            'file_size' => filesize(public_path() . $file_url),
            'mime_type' => $file->getClientOriginalExtension(),
            'block' => $path
        ];
    }
    public function updateFile(UploadedFile $file, $uploadPath, $oldFilePath, $prefiex)
    {
        $this->deleteFile($oldFilePath);
        return $this->uploadFile($file, $uploadPath, $prefiex);
    }
    protected function deleteFile($filePath)
    {
        if (File::exists(public_path($filePath))) {
            File::delete(public_path($filePath));
        }
    }

    public function copyFile($sourcePath, $block)
    {
        $absoluteSourcePath = public_path($sourcePath);
        $fileName = pathinfo($absoluteSourcePath, PATHINFO_BASENAME);
        $destinationDirectory = public_path("/uploads/$block");
        $destinationPath = $destinationDirectory . '/' . $fileName;
        if (file_exists($absoluteSourcePath)) {
            if (!file_exists($destinationDirectory)) {
                mkdir($destinationDirectory, 0777, true);
            } else {
                \Log::error("Destination directory not exist " . $sourcePath);
            }
            if (copy($absoluteSourcePath, $destinationPath)) {
                return true;
            } else {
                \Log::error("Failed to copy file: " . $sourcePath);
                return false;
            }
        } else {
            \Log::error("Source file not found: " . $sourcePath);
            return false;
        }
    }
}