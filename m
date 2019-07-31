Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4FC7D030
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 23:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730970AbfGaVmT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 17:42:19 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45023 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730968AbfGaVmS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 17:42:18 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so32562554pfe.11;
        Wed, 31 Jul 2019 14:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z8DZydj2ULEfBX9+AAzji7Lj5ADxAHIWb/q8Ck/LDFY=;
        b=Eu7MR1nxoZwpBUw10a38OPAoTHFOP0y/U/rYq0ffDJqF/uo0dHXYiQtdglD7nKCpf8
         HBRD8ilExzRW844mZSg/0mQS0u58nb7p/rT7eexaqhjBtNd2n2YYNuXLr0dFu4xYC8oK
         S8cJkG68plXqO7/lKm+KOGbcesb96PCus7m7BTAKcEmojDfHdESWkqeZrKqeOH1mWz7f
         53kYkUAp3/HFh38h7ugvfrPN/tbiKWTPHKs6w9k/ToUAXgYqWinVZkYWzVky1hyP58fy
         nIUPdssEVi7BBJbqv50NBM3XMzrbTHXeQmneyBu0/0qYXEhBCaOtkIfyZQyDzwKrD7cN
         qjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=z8DZydj2ULEfBX9+AAzji7Lj5ADxAHIWb/q8Ck/LDFY=;
        b=YTL6Uebw5PzcPZHL3KDRtVlcevFqkrW/8hXfV7vWPpAz7Wp2za7IzWMrF/DNrb3yij
         FvjXeA6yTuW2V3/EagOCTMPxYO7xk5qLzdIfMwmQBloO3iBrE4fd/qoA0yeUsmYldRms
         S4YhAg3iT2hImMsg+FAFix2EIn1qu45Afz8Pm9X3QTI8V6RMX7Nd7AYqUncqgzFVzYaG
         CJdBUvbvC7uAcRMK7iA2Q5tEx+8zZdkUgTjQbSYGRmlNLIFQ1Ss0/D3PeQmZNoHY136d
         2Fv+RWMSjR+05w6q2A8O1YzEv/biNMRtchvCVWYzkAwZuFu0FhPNxahhnN9vMKkjTZER
         eFRA==
X-Gm-Message-State: APjAAAUO8+rEvw2EgZpz1N62WDRcG2EIhoS3A3MqVPGdyNlWWWOQCRBK
        NciN2tG1pHCXXNhhJB5wUJUCNDP+
X-Google-Smtp-Source: APXvYqwLh+aTAtIm5iV3ZewlZWnAUNsRto8aTQBfjqQSdNk0wnd8NSGyS1J0KjrJ/l4z/IjDItWLQg==
X-Received: by 2002:a17:90a:2385:: with SMTP id g5mr5102658pje.12.1564609338044;
        Wed, 31 Jul 2019 14:42:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s24sm69962639pfh.133.2019.07.31.14.42.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 14:42:17 -0700 (PDT)
Date:   Wed, 31 Jul 2019 14:42:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] watchdog: ziirave_wdt: Add missing newline
Message-ID: <20190731214216.GA17277@roeck-us.net>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
 <20190731174252.18041-2-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731174252.18041-2-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 31, 2019 at 10:42:48AM -0700, Andrey Smirnov wrote:
> Add missing newline.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ziirave_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index dec660c509b3..6ec028fb2635 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -671,7 +671,7 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  		if (ret)
>  			return ret;
>  
> -		dev_info(&client->dev, "Timeout set to %ds.",
> +		dev_info(&client->dev, "Timeout set to %ds\n",
>  			 w_priv->wdd.timeout);
>  	}
>  
> -- 
> 2.21.0
> 
