Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 084C52CF95
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2019 21:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfE1Tgn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 May 2019 15:36:43 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38239 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfE1Tgn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 May 2019 15:36:43 -0400
Received: by mail-pl1-f193.google.com with SMTP id f97so8766109plb.5;
        Tue, 28 May 2019 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g0VLcHOI9dr8nUJdaeGPl0GnSakrQFNwY4f43ckavZU=;
        b=V8t9Ow80MuLAyv80PMABWLZiFMAVhL3UeGEVd4gEewjvdQyZnydbJxK94WVoBsqc8M
         +FUvERiVS0jTncZOvSENr2fkRthGVUPtr8gyKDqJNrwl4GPanJhBhNIEShiMNlNceWk7
         9ADAOqKNtdUgy7+AsGJ+jgM1qKwxfT7kYYm5Y30mjD3b1pZaqlWHutWzk5lrhsfHo3iN
         HmO9yX6RQC2JSqH5qy/fc1KGa0rySoi8GwblLSBWn+J+nnc1W/lPbc/E4w7tqv2ucbR0
         GwcaOQGIa4Lf4J+Scliew6iU8FKg0B7xvtldf6HBv8zlbmfTiXM2XO8MBIs86LZMM6XV
         1zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=g0VLcHOI9dr8nUJdaeGPl0GnSakrQFNwY4f43ckavZU=;
        b=EUweraSoaEtVaUjZcnxkFrUhOcQrVegz0OohAU1H+20ioBXZDXJYrKG+H0x/ajJiBp
         M6lyt2cfSttS43A19WRdKgKoAnZusDQ/T9nxGxq1nsJDhajiaqqWiA5bJwa2NngagTNu
         +0w2a8UGG5Um7oHF9r/ZL4NZMO2piQYLNvaU6bepP0R0sNqVybzvLFOdQsAUWVD11om0
         8bmwi8PYweIGMvgKLps3H1hYc0m1cm0e35tKqQAlt57FDpBcY21nTlT3gEdJziLpGQwD
         GLpufWTiElM+Z3bCHl5TiUdwfHEvIefHAS3sPDf9Zp9SNnv89hd5evM4rUlCtXdxHcDa
         Q2xg==
X-Gm-Message-State: APjAAAXCgeXEM2QcttyAAKBDzJPPkjJZ8RRqnXXHYg+OCdxHBatnNBZs
        otsquDqyG7W/RSpEOQUXO60=
X-Google-Smtp-Source: APXvYqzVopFjqifamjKE8S0/YI1+gLz5KtbJ19JyJbB7AZMW2cooxPS0VOAEfH7na46PWnuB/Dq0EA==
X-Received: by 2002:a17:902:5ac9:: with SMTP id g9mr137499645plm.134.1559072201902;
        Tue, 28 May 2019 12:36:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s18sm13664185pgg.64.2019.05.28.12.36.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 12:36:41 -0700 (PDT)
Date:   Tue, 28 May 2019 12:36:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] watchdog: jz4740: Drop dependency on MACH_JZ47xx
Message-ID: <20190528193640.GC24853@roeck-us.net>
References: <20190521155313.19326-1-paul@crapouillou.net>
 <20190521155313.19326-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521155313.19326-3-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, May 21, 2019 at 05:53:12PM +0200, Paul Cercueil wrote:
> Depending on MACH_JZ47xx prevent us from creating a generic kernel that
> works on more than one MIPS board. Instead, we just depend on MIPS being
> set.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7ea60371bda0..dccf22bb230c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1633,7 +1633,7 @@ config INDYDOG
>  
>  config JZ4740_WDT
>  	tristate "Ingenic jz4740 SoC hardware watchdog"
> -	depends on MACH_JZ4740 || MACH_JZ4780
> +	depends on MIPS
>  	select WATCHDOG_CORE
>  	help
>  	  Hardware driver for the built-in watchdog timer on Ingenic jz4740 SoCs.
> -- 
> 2.21.0.593.g511ec345e18
> 
