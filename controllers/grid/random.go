package grid

import (
	"github.com/taironas/tinygraphs/colors"
	"github.com/taironas/tinygraphs/draw"
	"github.com/taironas/tinygraphs/misc"
	"github.com/taironas/tinygraphs/write"
	"image"
	"log"
	"net/http"
)

// handler for "/gird/random"
// generates a black and white grid random image.
func Random(w http.ResponseWriter, r *http.Request) {
	size := size(r)
	m := image.NewRGBA(image.Rect(0, 0, size, size))
	colorMap := colors.MapOfColorPatterns()
	draw.RandomGrid6X6(m, colorMap[0][0], colorMap[0][1])
	var img image.Image = m
	write.Image(w, &img)
}

// handler for "/grid/random/[0-9]"
// generates a grid random image with a specific color based on the colorMap
func RandomColor(w http.ResponseWriter, r *http.Request) {
	intID, err := misc.PermalinkID(r, 3)
	if err != nil {
		log.Printf("error when extracting permalink id: %v", err)
	} else {
		size := size(r)
		m := image.NewRGBA(image.Rect(0, 0, size, size))
		colorMap := colors.MapOfColorPatterns()
		draw.RandomGrid6X6(m, colorMap[int(intID)][0], colorMap[int(intID)][1])
		var img image.Image = m
		write.Image(w, &img)
	}
}
