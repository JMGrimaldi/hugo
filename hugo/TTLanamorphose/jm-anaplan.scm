(define (jm-anaplan img drawable x0 y0 x1 y1 x2 y2 x3 y3)
	(gimp-undo-push-group-start img)

	(set! lay (car (gimp-image-active-drawable img)))

	(gimp-perspective lay 1 x0 y0 x1 y1 x2 y2 x3 y3)

	(gimp-undo-push-group-end img)
	(gimp-displays-flush)
)

(script-fu-register
	"jm-anaplan" 
	"<Image>/Script-Fu/Anamorphose/Plane"
	"Anamorphose plane"
	"J.M. Grimaldi"
	"J.M. Grimaldi"
	"2001"
	"" 
	SF-IMAGE "Image" 0
	SF-DRAWABLE "Drawable" 0
	SF-VALUE "x0" "0"
	SF-VALUE "y0" "0"
	SF-VALUE "x1" "320"
	SF-VALUE "y1" "0"
	SF-VALUE "x2" "0"
	SF-VALUE "y2" "240"
	SF-VALUE "x3" "320"
	SF-VALUE "y3" "240"
)
