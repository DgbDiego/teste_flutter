import 'package:flutter/material.dart';

class VoteAverageBar{

  Widget voteAverage({
  required voteAvg,
  }){

    Color? avgColor(var value){
      if (value < 0.5 ) {
        return Colors.redAccent;
      } else if (value >= 0.5 && value < 0.7){
        return Colors.orangeAccent;
      } else if (value >= 0.7){
        return Colors.greenAccent;
      }
    }

    return Container(
      decoration: BoxDecoration(
          color: avgColor(voteAvg/10),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
                child: SizedBox(
                  width: 80,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        (voteAvg*10).round().toString()+'%',
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
            ),
            Flexible(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: (voteAvg/10),
                  backgroundColor: Colors.black38,
                  color: Colors.white,
                  minHeight: 15,
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}