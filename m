Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D602982C8
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Oct 2020 18:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1417676AbgJYRkq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Oct 2020 13:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1417675AbgJYRkp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Oct 2020 13:40:45 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CEDC061755;
        Sun, 25 Oct 2020 10:40:45 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 32so6071776otm.3;
        Sun, 25 Oct 2020 10:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xs3Wsd8vpaYG0UM0SIf7U3L3ysofl8Y/B4K3NZYbjsQ=;
        b=jdIuC8Z2TlU/9M8zE/okni2BBkixMFEeGyLKl1BhrItPQOCihSaWDeuQw5UO5TDQFZ
         sC/2X+xBbavK2V7IGqEOSMMNvf+wmyHC9G/TRB9oyfnsmqR2pvdXk3Yrvxs1dDBAvIrh
         MgFzSNso9CiegenrdlZJWFdCo9joocyJzwgjgpZi76fE0U3Jj8cHgs9674yA9wcRkVo5
         /ZttpDu4vG7Df4Kj5YdugKRowS30f4ynXqeK6EwjhjEZfPc7WZ2O6XWVMQ07zflnCUJT
         6yfC4cuAt7zeHEWwx9uoexTDpMb0HX7Wp8AQid+2aOwbufKx5aMU8TdysCfbcBVCaGoP
         J64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xs3Wsd8vpaYG0UM0SIf7U3L3ysofl8Y/B4K3NZYbjsQ=;
        b=qCBek8e4sQYUD35E5aWwBc/w90yqsjYqj3sG5RlCfo1AP0apoC5dZHKSCrUIFfa7tI
         LahUDTbyKhec9mjCLzUJOUS5d5qIW0VLGd1Nlm69cYKdFUhJSywJQlbwhQwg4PpWzQDi
         7+LOPyzb/9usjJ/LOE//InpYzq8wd37Qiu9dfBA9xsx4U1OwMQajJW/g3xVMFd78xQ07
         htPdSoQVI4O1zMCtuyI+KVsB5v+8/zxzIo9QIeCgczBUjXpzJODE2A2ZnlENTpCxelaq
         itA7pSk5pSJSbvz96mUyJYGlNpWWfyyTQiWFMpCAjADQesw5c1F2Mez0NvICE5ZCLynI
         sKmA==
X-Gm-Message-State: AOAM531qQkQJLFoHOLaf6aZZgzz78XoQBCqryU3kIz/vVW8kLYL4AhaZ
        0QqFvluYb0yxjYmwASYbLl/PSDv9NeU=
X-Google-Smtp-Source: ABdhPJxE11ZUs/Lg+b/GqRarUS32OOK5MhjSSKc3qRWkoCOLz+her3UYDE6ZBfll0B3f8Y1pd8CMtA==
X-Received: by 2002:a9d:6d99:: with SMTP id x25mr8352422otp.57.1603647644814;
        Sun, 25 Oct 2020 10:40:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 61sm2132820otc.9.2020.10.25.10.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2020 10:40:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: sbc_fitpc2_wdt: add __user annotations
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     kernel test robot <lkp@intel.com>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201025124518.31647-1-linux@rasmusvillemoes.dk>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d6774374-1024-61ee-78b9-d578d00772be@roeck-us.net>
Date:   Sun, 25 Oct 2020 10:40:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201025124518.31647-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/25/20 5:45 AM, Rasmus Villemoes wrote:
> After a change to the put_user() macro on x86, kernel test robot has
> started sending me complaints (from sparse) about passing kernel
> pointers to put_user(). So add the __user annotations to the various
> casts in fitpc2_wdt_ioctl(), and while in here, also make the write
> method actually match the prototype of file_operations::write.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

It would really be great if we can get rid of all those old drivers.
Can we mark them all as deprecated ?

Reviewed-by: Guenter Roeck <inux@roeck-us.net>

> ---
>  drivers/watchdog/sbc_fitpc2_wdt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/sbc_fitpc2_wdt.c b/drivers/watchdog/sbc_fitpc2_wdt.c
> index 04483d6453d6a147703e..13db71e165836eb73249 100644
> --- a/drivers/watchdog/sbc_fitpc2_wdt.c
> +++ b/drivers/watchdog/sbc_fitpc2_wdt.c
> @@ -78,7 +78,7 @@ static int fitpc2_wdt_open(struct inode *inode, struct file *file)
>  	return stream_open(inode, file);
>  }
>  
> -static ssize_t fitpc2_wdt_write(struct file *file, const char *data,
> +static ssize_t fitpc2_wdt_write(struct file *file, const char __user *data,
>  						size_t len, loff_t *ppos)
>  {
>  	size_t i;
> @@ -125,16 +125,16 @@ static long fitpc2_wdt_ioctl(struct file *file, unsigned int cmd,
>  
>  	switch (cmd) {
>  	case WDIOC_GETSUPPORT:
> -		ret = copy_to_user((struct watchdog_info *)arg, &ident,
> +		ret = copy_to_user((struct watchdog_info __user *)arg, &ident,
>  				   sizeof(ident)) ? -EFAULT : 0;
>  		break;
>  
>  	case WDIOC_GETSTATUS:
> -		ret = put_user(0, (int *)arg);
> +		ret = put_user(0, (int __user *)arg);
>  		break;
>  
>  	case WDIOC_GETBOOTSTATUS:
> -		ret = put_user(0, (int *)arg);
> +		ret = put_user(0, (int __user *)arg);
>  		break;
>  
>  	case WDIOC_KEEPALIVE:
> @@ -143,7 +143,7 @@ static long fitpc2_wdt_ioctl(struct file *file, unsigned int cmd,
>  		break;
>  
>  	case WDIOC_SETTIMEOUT:
> -		ret = get_user(time, (int *)arg);
> +		ret = get_user(time, (int __user *)arg);
>  		if (ret)
>  			break;
>  
> @@ -157,7 +157,7 @@ static long fitpc2_wdt_ioctl(struct file *file, unsigned int cmd,
>  		fallthrough;
>  
>  	case WDIOC_GETTIMEOUT:
> -		ret = put_user(margin, (int *)arg);
> +		ret = put_user(margin, (int __user *)arg);
>  		break;
>  	}
>  
> 

