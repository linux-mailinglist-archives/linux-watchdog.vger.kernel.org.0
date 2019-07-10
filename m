Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A20E64C55
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2019 20:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfGJSnF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Jul 2019 14:43:05 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44185 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfGJSnE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Jul 2019 14:43:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so1637359pgl.11;
        Wed, 10 Jul 2019 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0Hm/9BlG2vs6dalxd4Lxl0B723YTAQ0cgyoNTbJ0CW4=;
        b=ViG9maV71yomRUGX8jU5hhY5FVev8TYVmQqF/yL4Rt2nkfJS0UWVtCUg0F8uGgMBQ0
         v/h4zXJ5uYVk9Lr7XNnNzUJ2wI3XITjx8HyNTX7cOlA40N/JZ2eaJueAfF6grg3NssY+
         lYVhizviWNbIZJNhSF53wq+A1xp/iulzeBsQLuy52pT3IcXFo56Pw2x1AK6TiNAUlmJT
         GQNg3uTrhUyo9ArPgFz5HHAqpjf08fPU6NgJaKrPVxxdf+z5zBLa7a3hGLhdwcDB2MOi
         NMmszQVoEOlBa2oLL4zDYSxTpRCtCw9QQtbaoEXMQA9JwfW6S//mHLQKy51BLSFgHYFN
         EFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0Hm/9BlG2vs6dalxd4Lxl0B723YTAQ0cgyoNTbJ0CW4=;
        b=csB5tVyVPflzroDp29JgZe4fTx7iIEge5Wu6/uQRw2lPRZEdB/+U/dxSZImfBCAVyH
         aTpbG0Fb7BhllVwzma2l8VUrNS5Dumr+399w7ieKCHlwTaH8vyqQsKUeRMXd3ziM5NQO
         1skI6U0EvNg7NzXc2o91/cGGz62n75ILQzQ+xqQG7wAOCzMYf+61cXPBqIv5I5gyJBOe
         /yeKTwf3+PQ/n2tcLI2nqKZk29a3kZtyzBLeiZVExaItyPZwRLQsbS5PUcBlzv+MoroZ
         cI8gz/v8Usp6KFThV/c4nSMQiy9GXKX9WdCMkjTLm8BxJ6DgssXqO9vYnqsRq/QVeu4D
         wySQ==
X-Gm-Message-State: APjAAAXebIl8RlxaJRGX3LSQHtVwi4OfHTa6+3K7P+fV2mMZN2nhmpfM
        JRfTWCWxLMAc+LcQiTwjrX4=
X-Google-Smtp-Source: APXvYqwEY9f/6Aqc9JPG54Pxy9aLQuyajI9Ihr11NbBTwvDbuIOfGWIMRv1meOxBcIUf0FABfqdSog==
X-Received: by 2002:a63:e1e:: with SMTP id d30mr38588995pgl.100.1562784183684;
        Wed, 10 Jul 2019 11:43:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m4sm5238919pgs.71.2019.07.10.11.43.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 11:43:02 -0700 (PDT)
Date:   Wed, 10 Jul 2019 11:43:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: digicolor_wdt: drop unused variable
Message-ID: <20190710184301.GA2961@roeck-us.net>
References: <20190710080904.317599-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710080904.317599-1-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 10, 2019 at 10:08:57AM +0200, Arnd Bergmann wrote:
> The last cleanup patch left behind an unused variable
> that should have been removed as well:
> 
> drivers/watchdog/digicolor_wdt.c:121:6: error: unused variable 'ret' [-Werror,-Wunused-variable]
> 
> Fixes: cdad26977e3f ("watchdog: digicolor_wdt: drop warning after registering device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Already submitted as https://patchwork.kernel.org/patch/11037487/ ...

Guenter

> ---
>  drivers/watchdog/digicolor_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
> index 33cda95bd238..073d37867f47 100644
> --- a/drivers/watchdog/digicolor_wdt.c
> +++ b/drivers/watchdog/digicolor_wdt.c
> @@ -118,7 +118,6 @@ static int dc_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct dc_wdt *wdt;
> -	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(struct dc_wdt), GFP_KERNEL);
>  	if (!wdt)
> -- 
> 2.20.0
> 
