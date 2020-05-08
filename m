Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E481CAD65
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 May 2020 15:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbgEHNB0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 May 2020 09:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729576AbgEHNBZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 May 2020 09:01:25 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08886C05BD43
        for <linux-watchdog@vger.kernel.org>; Fri,  8 May 2020 06:01:25 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f8so711509plt.2
        for <linux-watchdog@vger.kernel.org>; Fri, 08 May 2020 06:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e9pc8m33f+Di1GjIAL8PmUrVmUekIyLKEueDSFmAcQI=;
        b=QX/KF6MTvrvFB+/2ottN2yVHz1VOLM576+WzkqrVRFqSfKmZQnddJMGekiDjUml9bc
         0OFqx8YdG9ILUyoaNdBs2qI0hr05rq+I4MgyXaOKNga/gxeCGK4meG/Hb5qRiqnWHFo2
         kcqFHIChhY/ETW5aWDjD4ARdji0bSTcIjJ5Ptc1x5EQ8crna682FPc5NDNimOmd5oLfR
         iO0CCMgammlqG9LsdZsosvxOqZT72YmQb9TCi3d/H1GkNlVhZJOC4hpA0+VcGiUHRRFb
         /5OhvTXVnCWuEHACUtvw/KZQSToHyNR3sbELVl+HsNQaCykC9v5OyvTXA3KIhBnJbEoV
         eSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=e9pc8m33f+Di1GjIAL8PmUrVmUekIyLKEueDSFmAcQI=;
        b=aUqwbGN75r9PgxaD/vwfa23A4kN9EY50RgWkQYd+Ej4FG/UjyuUpFQ5gCr5xq93J68
         PJcN0qdk5l13ORCt/9PNwDqEhXs504cvu1X0ztUDaL2LQIDtIzuZcwH3mD/y8RhJSB9R
         DQO/limIpFR4YAyXx0mumTTtObYQPjJdcr7A+nvStDo3iM1tdA+OSU0+utHxgiKKRG9/
         rpQY2gqN5frszht6phg3YtYve43Q9jhSAu+uII9NkKuYpbTa0y7TQWxvkBRkwZL8Febb
         0hM/g0Ymy+w4tYIEAPeA4hW8HmHJsgK8ue7LSn2T+boU1obxim5bxbiDvoBv3cRxeM5S
         Fx5Q==
X-Gm-Message-State: AGi0PuZb9iggd9jx0aBMnS5wAx+6G++fIRHWXd/jVcY+5leuW/BPWtys
        a92E1Ko/MH1CX7/GfXLqyLauHlme
X-Google-Smtp-Source: APiQypIFrdxTsHMwvf1R3Bhtsvn0AII40Nlw7SijIwwMqGLY7juZKrElSU/YU+ATJYP7YOL/uEEzmw==
X-Received: by 2002:a17:90a:a50b:: with SMTP id a11mr5947810pjq.143.1588942884243;
        Fri, 08 May 2020 06:01:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w1sm1396951pgh.53.2020.05.08.06.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 06:01:23 -0700 (PDT)
Subject: Re: [RFC] driver: Adding helper macro for platform_driver
 boilerplate.
To:     harshal chaudhari <harshalchau04@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
References: <CAFEvwu=+qZts-bcR8svxLPoCcFtzQh42EJQXVD_5Jjpp9m-D+Q@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <18078080-67d9-a508-ccdf-fdc57b97ae8d@roeck-us.net>
Date:   Fri, 8 May 2020 06:01:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEvwu=+qZts-bcR8svxLPoCcFtzQh42EJQXVD_5Jjpp9m-D+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/8/20 4:39 AM, harshal chaudhari wrote:
> Hi Wim and Guenter,
> 
> 
> For simple module that contain a single platform_driver without any additional setup code then ends up being a block of duplicated boilerplate.
> 
> This patch add a new micro, module_platform_driver(), which replace the module_init()/module_exit() registrations with template functions.
> 
> 
> Signed-off-by: harshal chaudhari <harshalchau04@gmail.com <mailto:harshalchau04@gmail.com>>
> 

First, this is not in correct patch format. Second, I don't really see
the point of making such changes without converting the driver to use
the watchdog subsystem.

Guenter

> Patch as below:
> 
> diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
> index f6541d1b65e3..e1e9d5ecd31c 100644
> --- a/drivers/watchdog/gef_wdt.c
> +++ b/drivers/watchdog/gef_wdt.c
> @@ -300,6 +300,7 @@ static const struct of_device_id gef_wdt_ids[] = {
>         },
>         {},
>  };
> +
>  MODULE_DEVICE_TABLE(of, gef_wdt_ids);
>  
>  static struct platform_driver gef_wdt_driver = {
> @@ -311,19 +312,7 @@ static struct platform_driver gef_wdt_driver = {
>         .remove         = gef_wdt_remove,
>  };
>  
> -static int __init gef_wdt_init(void)
> -{
> -       pr_info("GE watchdog driver\n");
> -       return platform_driver_register(&gef_wdt_driver);
> -}
> -
> -static void __exit gef_wdt_exit(void)
> -{
> -       platform_driver_unregister(&gef_wdt_driver);
> -}
> -
> -module_init(gef_wdt_init);
> -module_exit(gef_wdt_exit);
> +module_platform_driver(gef_wdt_driver);
> 
> 
> 
> Thanks & Regards,
> 
> Harshal Chaudhari
> 

