import 'package:flutter/material.dart';
Widget buildArticleItem({article,context,launchUrl})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
           color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(maxLines: 2,'${article['author']}',style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontSize: 20,
          ),),
        )),
      ),
      const SizedBox(width: 20,),
      Expanded(
        child: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(overflow: TextOverflow.ellipsis,maxLines: 4,'${article['title']}',style:Theme.of(context).textTheme.bodyLarge)),
              Text('${article['publishedAt']}',style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize:20 ,)),
            ],
          ),
        ),
      )
    ],
  ),
);
Widget textFormFieldCustom({
  TextEditingController? controller,
  String? hint,
  IconData? prefix,
  IconData? suffix,
  String? Function(String?)? validator,
  TextInputType? keyboardType,
  void Function(String)? onChanged,
  void Function()? onTap
}
    )
=>TextFormField(
  onTap: onTap,
  onChanged:onChanged ,
  keyboardType:keyboardType ,
  validator: validator,
  controller: controller,
  decoration: InputDecoration(
      hintStyle:const TextStyle(
      fontSize: 20,
      color:Colors.white,
      fontWeight: FontWeight.bold
  ),
      suffixIcon: Icon(suffix),
      suffixIconColor: Colors.black,
      prefixIconColor: Colors.white,
      fillColor: Colors.blueGrey,
      filled: true,
      hintText:hint??'',
      prefixIcon: Icon(prefix),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            width: 3,
            color: Colors.blueGrey
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            width: 2,
            color: Colors.blueGrey
        ),
      ),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              width: 3,
              color: Colors.red
          )
      )
  ),
);
void navigateTo(context,widget)=>Navigator.push(context,MaterialPageRoute(builder:(context)=>widget));
