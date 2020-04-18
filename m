Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B281AEC22
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Apr 2020 13:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgDRLqu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 Apr 2020 07:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725862AbgDRLqu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 Apr 2020 07:46:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4540C061A0C;
        Sat, 18 Apr 2020 04:46:48 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t16so2005661plo.7;
        Sat, 18 Apr 2020 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=30fKqiU6bJf0p7yv44RiLtRg7kpa2QvHSUtHuqX0ONM=;
        b=JHyto2c/AckOMsMp2kzJE7DlXfSOjunIgXd2of1R9ArsB3mFMR0Y8l7UWPAiDjkJII
         T+ZzEX8mM3b4rE/4wAwF7WBDUdRnhM5P0/pSqNv/w1Qj7o6GCMIP5cMxpifF22i+fVuw
         /cqRVlUZaJYfCfNyFDB3Z7fouc1pZmFk7iPfHnYo/yK/XcDYKJYgQv1mB9VwIndo3/n6
         OeyOPiCaXAtpB2g7pDeNWtJPYe34psaF/GOZUQ2JV5LgA2xjH6shFvkPwDM67iCzsZhn
         BFlVrMOBr9R4F7bLVCGNnTYMdkVSUiwjeXi/p8VieS5pTwOoiN7vcOwcsS29TRtevULF
         /fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=30fKqiU6bJf0p7yv44RiLtRg7kpa2QvHSUtHuqX0ONM=;
        b=kvvZD5di4D4TiZuF0ToJrszZ2u1qyaD4U24SsccqJJdfUYseRS2Gu+NFLgT53dU8qh
         tcwR/9OV1oEFuXavM/aHoW83Gduix4IYOtg5lEz6cnSGLjL65awws/Wu36zOsSs6wq/l
         A5eIp9RWyYFWdieprkHtkyjAE5LZeHuuA8BUsuRy5R+fubKoMuUiW7oWIm3b+Ykrimyp
         sr4h0NhWV9B7odu5HFTAqijEc/wMZ8AWGwu3E7Txd+FbRJpVivzhZcC9pLBgCPde0/L2
         IHSVQN3O3LHUhp7uCMWV/4gJBe6WwlyKU2jBNSts7qxNKsooDEf9hBuG9g+XHZ28bT4e
         k64Q==
X-Gm-Message-State: AGi0PuZJxWycEw8r5YWgaRYJYFZk0daIQ6YCXMzd9gukCA3/c63EKngD
        HyWi8J3qXj8RKS+AbWpcAlI=
X-Google-Smtp-Source: APiQypIYAfowXCtc3wGIQ3alK+3u6ow/ltOUiP8pq4FIAhXiZxM6pW3vBDznFRVXFZRdY8fzpKBhnw==
X-Received: by 2002:a17:90a:628c:: with SMTP id d12mr9806604pjj.53.1587210408308;
        Sat, 18 Apr 2020 04:46:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 36sm20661537pgs.70.2020.04.18.04.46.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Apr 2020 04:46:47 -0700 (PDT)
Date:   Sat, 18 Apr 2020 04:46:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@mellanox.com
Cc:     wim@linux-watchdog.org, andy@infradead.org, dvhart@infradead.org,
        linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com
Subject: Re: [PATCH v1 4/4] Documentation/watchdog: Add description of new
 watchdog type 3
Message-ID: <20200418114646.GB103392@roeck-us.net>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
 <20200416163514.7334-5-michaelsh@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416163514.7334-5-michaelsh@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Apr 16, 2020 at 07:35:14PM +0300, michaelsh@mellanox.com wrote:
> From: Michael Shych <michaelsh@mellanox.com>
> 
> Add documentation with details of new type of Mellanox watchdog driver.
> 
> Signed-off-by: Michael Shych <michaelsh@mellanox.com>
> 

Stray empty line.

Also, the subject should reflect the driver name.

Guenter

> Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  Documentation/watchdog/mlx-wdt.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/watchdog/mlx-wdt.rst b/Documentation/watchdog/mlx-wdt.rst
> index bf5bafac47f0..fa0a94e5c82e 100644
> --- a/Documentation/watchdog/mlx-wdt.rst
> +++ b/Documentation/watchdog/mlx-wdt.rst
> @@ -24,10 +24,19 @@ Type 2:
>    Maximum timeout is 255 sec.
>    Get time-left is supported.
>  
> +Type 3:
> +  Same as Type 2 with extended maximum timeout period.
> +  Maximum timeout is 65535 sec.
> +
>  Type 1 HW watchdog implementation exist in old systems and
>  all new systems have type 2 HW watchdog.
>  Two types of HW implementation have also different register map.
>  
> +Type 3 HW watchdog implementation can exist on all Mellanox systems
> +with new programmer logic device.
> +It's differentiated by WD capability bit.
> +Old systems still have only one main watchdog.
> +
>  Mellanox system can have 2 watchdogs: main and auxiliary.
>  Main and auxiliary watchdog devices can be enabled together
>  on the same system.
> -- 
> 2.11.0
> 
