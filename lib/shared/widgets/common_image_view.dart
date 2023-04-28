// ignore_for_file: must_be_immutable

import 'dart:io';

//-import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonImageView extends StatelessWidget {
  ///[url] is required parameter for fetching network image
  String? url;
  String? imagePath;
  String? svgPath;
  File? file;
  double? height;
  double? width;
  bool isDark;
  bool isRtl;
  bool isBackBtn;

  final BoxFit fit;
  final String placeHolder;

  ///a [CommonNetworkImageView] it can be used for showing any network images
  /// it will shows the placeholder image if image is not found on network
  CommonImageView({
    this.url,
    this.imagePath,
    this.svgPath,
    this.isDark=false,
    this.isRtl=false,
    this.isBackBtn=false,
    this.file,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  @override
   Widget build(BuildContext context) {
   
    
    return _buildImageView(context);
  }

  Widget _buildImageView(BuildContext context) {

    if (svgPath != null && svgPath!.isNotEmpty&& isDark) {
      return isBackBtn? InkWell(
        onTap: (){
          if(Navigator.canPop(context))
          Navigator.pop(context);
        },
        child: Container(
          height: height,
          width: width,
          child:isRtl?
            RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
              svgPath!,
              height: height,
              color: Colors.white,
              width: width,
              fit: fit,
                      ),
            ):
       
           SvgPicture.asset(
            svgPath!,
            height: height,
            width: width,
            color: Colors.white,
            fit: fit,
          ),
       
       
        ),
      ):
      Container(
        height: height,
        width: width,
        child: isRtl?
            RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
              svgPath!,
              height: height,
              color: Colors.white,
              width: width,
              fit: fit,
                      ),
            ):
       
           SvgPicture.asset(
            svgPath!,
            height: height,
            color: Colors.white,
            width: width,
            fit: fit,
          ),
       
       
      );
    }
    if (svgPath != null && svgPath!.isNotEmpty) {
      return isBackBtn? InkWell(
        onTap: (){
          if(Navigator.canPop(context))
          Navigator.pop(context);
        },
        child: Container(
          height: height,
          width: width,
          child:isRtl?
            RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
              svgPath!,
              height: height,
             
              width: width,
              fit: fit,
                      ),
            ):
       
           SvgPicture.asset(
            svgPath!,
            height: height,
            width: width,
           
            fit: fit,
          ),
       
       
        ),
      ):
      Container(
        height: height,
        width: width,
        child: isRtl?
            RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
              svgPath!,
              height: height,
              width: width,
              fit: fit,
                      ),
            ):
       
           SvgPicture.asset(
            svgPath!,
            height: height,
            width: width,
            fit: fit,
          ),
       
       
      );
    }



     else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
      );
    } 
    
    /*else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        placeholder: (context, url) => Container(
          height: 30,
          width: 30,
          child: LinearProgressIndicator(
            color: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    }*/
    
     else if (imagePath != null && imagePath!.isNotEmpty&& isDark) {
      return isBackBtn? InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child:isRtl? Image.asset(
          imagePath!,
          height: height,
          width: width,
          color: Colors.white,
          fit: fit,
        ):
        
        Image.asset(
          imagePath!,
          height: height,
          width: width,
          color: Colors.white,
          fit: fit,
        ),
      ):
      Image.asset(
        imagePath!,
        height: height,
        width: width,
        color: Colors.white,
        fit: fit,
      );
    }
      else if (imagePath != null && imagePath!.isNotEmpty) {
      return isBackBtn? InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child:isRtl? Image.asset(
          imagePath!,
          height: height,
          width: width,
          fit: fit,
        ):
        
        Image.asset(
          imagePath!,
          height: height,
          width: width,
         
          fit: fit,
        ),
      ):
      Image.asset(
        imagePath!,
        height: height,
        width: width,
       
        fit: fit,
      );
    }
   
   
   
   
    return SizedBox();
  }
}


class CommonImageViewWithDarkOption extends StatefulWidget {
  ///[url] is required parameter for fetching network image
  String? url;
  String? imagePath;
  String? svgPath;
  File? file;
  bool isBackBtn;
  bool isRtl;
  bool isDark;
  double? height;
  double? width;
  final BoxFit fit;
  final String placeHolder;

  ///a [CommonNetworkImageView] it can be used for showing any network images
  /// it will shows the placeholder image if image is not found on network
  CommonImageViewWithDarkOption({
    this.isDark=false,
    this.isRtl=false,
    this.isBackBtn=false,
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  @override
  State<CommonImageViewWithDarkOption> createState() => _CommonImageViewWithDarkOption();
}

class _CommonImageViewWithDarkOption extends State<CommonImageViewWithDarkOption> {
  @override
   Widget build(BuildContext context) {
   
    return _buildImageView(context);
  }

  Widget _buildImageView(BuildContext context) {
    if (widget.svgPath != null && widget.svgPath!.isNotEmpty) {
      return widget.isBackBtn? InkWell(
        onTap: (){
        Navigator.canPop(context)?Navigator.pop(context):SizedBox();
        
        },
        child: Container(

          height: widget.height,
          width: widget.width,
          child:widget.isRtl?RotatedBox(
            quarterTurns: 2,
          
          child: SvgPicture.asset(
            widget.svgPath!,
            color: widget.isDark?Colors.white:Colors.black,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
          ),
          ): SvgPicture.asset(
            widget.svgPath!,
            color: widget.isDark?Colors.white:Colors.black,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
          ),
        ),
      )
   : Container(
        height: widget.height,
        width: widget.width,
        child:widget.isRtl?RotatedBox(
          quarterTurns: 2,
        
        child: SvgPicture.asset(
          widget.svgPath!,
          color: widget.isDark?Colors.white:Colors.black,
          height: widget.height,
          width: widget.width,
          fit: widget.fit,
          
        ),
        ): SvgPicture.asset(
          widget.svgPath!,
          height: widget.height,
          color: widget.isDark?Colors.white:Colors.black,
          width: widget.width,
          fit: widget.fit,
        ),
      );
   
    }
    
    
     else if (widget.file != null && widget.file!.path.isNotEmpty) {
      return Image.file(
        widget.file!,
        height: widget.height,
       
       
        width: widget.width,
        fit: widget.fit,
      );
    } /*else if (widget.url != null && widget.url!.isNotEmpty) {
      return CachedNetworkImage(
        height: widget.height,
        width: widget.width,
        fit: widget.fit,
        imageUrl: widget.url!,
        placeholder: (context, url) => Container(
          height: 30,
          width: 30,
          child: LinearProgressIndicator(
            color: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          widget.placeHolder,
          height: widget.height,
          width: widget.width,
          fit: widget.fit,
        ),
      );
    } */else if (widget.imagePath != null && widget.imagePath!.isNotEmpty) {
      return Image.asset(
        widget.imagePath!,
        height: widget.height,
        width: widget.width,
        fit: widget.fit,
      );
    }
    return SizedBox();
  }
}
