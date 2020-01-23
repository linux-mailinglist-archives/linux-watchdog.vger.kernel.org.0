Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D649B1472DC
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jan 2020 21:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgAWUzB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jan 2020 15:55:01 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40870 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgAWUzA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jan 2020 15:55:00 -0500
Received: by mail-pg1-f194.google.com with SMTP id k25so1975001pgt.7;
        Thu, 23 Jan 2020 12:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VkVxNXoZb5ITMLmFjeLX1O6fjDK5AnFJMJ0BZSxNB5g=;
        b=m+lTZedK9gWF4xwuaTyxbjIg3bAIdwWaB6Ad4V6MfH/Vio65HRNqXkwK0kgc01h0kI
         5kTOxiQ9vPmo/ygxF2dAX9D/uL+c4r7xKDUHv68qzm1sfcDeh8kyhOg3Ukk4LmkYxD1J
         jhvIj68UrMBL5PdrQpg1Ee9cJPRODjOuka+qYPSICNp8lJaI6wlOhtJmKECSi3W7Zwxl
         8ekZzqlJAQnsRemRBYW1i2PAS3flE+CrcoRJ2ZLEAylFOSCFtIhLVSAewJepv1s3wn8Y
         uv8/6fmuYtlTTfHu3MSpoJQWNJarjMQShWNHz2zAieUl75osDU5NX4dV/BCT0O6Iu5Ii
         Prsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VkVxNXoZb5ITMLmFjeLX1O6fjDK5AnFJMJ0BZSxNB5g=;
        b=AVUF0vXy9InGmK4sr4LcAfNTTa+YD1cKGuflc33KSgWoUlAVoA49Z0o8m+5b5ZLbtL
         O1FMCGU6yUeI6v6imxKWSjilkeqyvoOnF1J4kBCnhfE3DecmEGI786hY+vq4bALtuU3D
         jnO16cLCCkSx4geOzaMlu+sNh0U7QTknJ0bZqRU6sZHSbRvU72doKbMXN6fMWQHcS4eS
         /gJQoszJTjWJUatICNnCELmwZlpWVvXCXhC0uXJ5Otk+FuWB4ytdi0WQHsVbrbqV9XL/
         VR7tN9foZT7ct3SbSi1hoTjiSdou8mahQ9qAqkftxsrxYQSYUffjEi23Lvjv7E29KnTG
         hoJA==
X-Gm-Message-State: APjAAAWvROhUbffPyAVoQcMQSb2OR0eadWXNNrXdjlJc2i4pzlL2Xi7s
        0ChEpY0i2jrv1GLBEcVUBg4=
X-Google-Smtp-Source: APXvYqzHIJnoi81iMDc7G9FPl8tVJE3Z0QS08Q2YEjqX/z/j/UPzE2UfRZuf39Ccdq50EzPulbIa6Q==
X-Received: by 2002:aa7:8ecf:: with SMTP id b15mr144675pfr.86.1579812900166;
        Thu, 23 Jan 2020 12:55:00 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e38sm2857390pgm.82.2020.01.23.12.54.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 12:54:59 -0800 (PST)
Date:   Thu, 23 Jan 2020 12:54:58 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Yong Liang <yong.liang@mediatek.com>
Cc:     wim@linux-watchdog.org, p.zabel@pengutronix.de,
        matthias.bgg@gmail.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        jiaxin.yu@mediatek.com, yingjoe.chen@mediatek.com, sboyd@kernel.org
Subject: Re: [PATCH v12 4/4] watchdog: mtk_wdt: mt2712: Add reset controller
Message-ID: <20200123205458.GA13785@roeck-us.net>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
 <20200115085828.27791-5-yong.liang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115085828.27791-5-yong.liang@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 15, 2020 at 04:58:28PM +0800, Yong Liang wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add reset controller for 2712.
> Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index e88aacb0404d..d6a6393f609d 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,6 +9,7 @@
>   * Based on sunxi_wdt.c
>   */
>  
> +#include <dt-bindings/reset-controller/mt2712-resets.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -67,6 +68,10 @@ struct mtk_wdt_data {
>  	int toprgu_sw_rst_num;
>  };
>  
> +static const struct mtk_wdt_data mt2712_data = {
> +	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> +};
> +
>  static const struct mtk_wdt_data mt8183_data = {
>  	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>  };
> @@ -314,6 +319,7 @@ static int mtk_wdt_resume(struct device *dev)
>  #endif
>  
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
> +	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>  	{ .compatible = "mediatek,mt6589-wdt" },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ /* sentinel */ }
